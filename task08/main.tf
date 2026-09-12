data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location

  tags = local.common_tags
}


# ============================================================
# Key Vault
# ============================================================

module "keyvault" {
  source = "./modules/keyvault"

  name                = local.keyvault_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  current_user_object_id = data.azurerm_client_config.current.object_id

  tags = local.common_tags
}


# ============================================================
# Redis
# ============================================================

module "redis" {
  source = "./modules/redis"

  name                = local.redis_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  key_vault_id = module.keyvault.id

  hostname_secret_name    = local.redis_hostname_secret_name
  primary_key_secret_name = local.redis_key_secret_name

  tags = local.common_tags

  depends_on = [
    module.keyvault
  ]
}


# ============================================================
# Read Redis values back from Key Vault for ACI
# ============================================================

data "azurerm_key_vault_secret" "redis_hostname" {
  name         = local.redis_hostname_secret_name
  key_vault_id = module.keyvault.id

  depends_on = [
    module.redis
  ]
}

data "azurerm_key_vault_secret" "redis_primary_key" {
  name         = local.redis_key_secret_name
  key_vault_id = module.keyvault.id

  depends_on = [
    module.redis
  ]
}


# ============================================================
# Azure Container Registry
# ============================================================

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tags = local.common_tags

  app_image_name = local.app_image_name
  image_tag      = local.image_tag

  git_repo_url = var.git_repo_url
  git_branch   = var.git_branch
  git_pat      = var.git_pat
}


# ============================================================
# AKS
# ============================================================

module "aks" {
  source = "./modules/aks"

  name                = local.aks_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  acr_id       = module.acr.id
  key_vault_id = module.keyvault.id

  tenant_id = data.azurerm_client_config.current.tenant_id

  tags = local.common_tags

  depends_on = [
    module.redis
  ]
}


# ============================================================
# Azure Container Instance
# ============================================================

module "aci" {
  source = "./modules/aci"

  name                = local.aci_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tags = local.common_tags

  image = "${module.acr.login_server}/${local.app_image_name}:${local.image_tag}"

  acr_server   = module.acr.login_server
  acr_username = module.acr.admin_username
  acr_password = module.acr.admin_password

  redis_hostname    = data.azurerm_key_vault_secret.redis_hostname.value
  redis_primary_key = data.azurerm_key_vault_secret.redis_primary_key.value

  dns_name_label = local.aci_name

  depends_on = [
    module.acr,
    module.redis
  ]
}


# ============================================================
# Kubernetes SecretProviderClass
# ============================================================

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/secret-provider.yaml.tftpl",
    {
      aks_kv_access_identity_id = module.aks.kv_access_identity_client_id

      kv_name = module.keyvault.name

      redis_url_secret_name = local.redis_hostname_secret_name

      redis_password_secret_name = local.redis_key_secret_name

      tenant_id = data.azurerm_client_config.current.tenant_id
    }
  )

  depends_on = [
    module.aks,
    module.redis
  ]
}


# ============================================================
# Kubernetes Deployment
# ============================================================

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/deployment.yaml.tftpl",
    {
      acr_login_server = module.acr.login_server
      app_image_name   = local.app_image_name
      image_tag        = local.image_tag
    }
  )

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [
    kubectl_manifest.secret_provider,
    module.acr
  ]
}


# ============================================================
# Kubernetes Service
# ============================================================

resource "kubectl_manifest" "service" {
  yaml_body = file(
    "${path.module}/k8s-manifests/service.yaml"
  )

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [
    kubectl_manifest.deployment
  ]
}


# ============================================================
# Read Kubernetes LoadBalancer Service
# ============================================================

data "kubernetes_service_v1" "app" {
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [
    kubectl_manifest.service
  ]
}