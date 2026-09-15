data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  name                   = local.keyvault_name
  location               = azurerm_resource_group.this.location
  resource_group_name    = azurerm_resource_group.this.name
  tenant_id              = data.azurerm_client_config.current.tenant_id
  current_user_object_id = data.azurerm_client_config.current.object_id
  tags                   = local.common_tags
}

module "storage" {
  source = "./modules/storage"

  name                = local.sa_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  container_name      = local.storage_container_name
  blob_name           = local.archive_blob_name
  application_dir     = "${path.module}/application"
  tags                = local.common_tags
}

module "aci_redis" {
  source = "./modules/aci_redis"

  name                 = local.redis_aci_name
  location             = azurerm_resource_group.this.location
  resource_group_name  = azurerm_resource_group.this.name
  key_vault_id         = module.keyvault.id
  hostname_secret_name = local.redis_hostname_secret_name
  password_secret_name = local.redis_password_secret_name
  tags                 = local.common_tags

  depends_on = [
    module.keyvault
  ]
}

module "acr" {
  source = "./modules/acr"

  name                 = local.acr_name
  location             = azurerm_resource_group.this.location
  resource_group_name  = azurerm_resource_group.this.name
  app_image_name       = local.app_image_name
  image_tag            = local.image_tag
  context_path         = module.storage.blob_url
  context_access_token = module.storage.sas_token
  tags                 = local.common_tags

  depends_on = [
    module.storage
  ]
}

module "aks" {
  source = "./modules/aks"

  name                = local.aks_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  acr_id              = module.acr.id
  key_vault_id        = module.keyvault.id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = local.common_tags

  depends_on = [
    module.acr,
    module.aci_redis,
  ]
}

module "aca" {
  source = "./modules/aca"

  name                     = local.aca_name
  environment_name         = local.aca_env_name
  location                 = azurerm_resource_group.this.location
  resource_group_name      = azurerm_resource_group.this.name
  acr_id                   = module.acr.id
  acr_login_server         = module.acr.login_server
  key_vault_id             = module.keyvault.id
  tenant_id                = data.azurerm_client_config.current.tenant_id
  redis_hostname_secret_id = module.aci_redis.hostname_secret_id
  redis_password_secret_id = module.aci_redis.password_secret_id
  app_image_name           = local.app_image_name
  image_tag                = local.image_tag
  tags                     = local.common_tags

  depends_on = [
    module.acr,
    module.aci_redis,
  ]
}

module "k8s" {
  source = "./modules/k8s"

  providers = {
    kubectl    = kubectl
    kubernetes = kubernetes
  }

  deployment_template_path      = "${path.module}/k8s-manifests/deployment.yaml.tftpl"
  secret_provider_template_path = "${path.module}/k8s-manifests/secret-provider.yaml.tftpl"
  service_manifest_path         = "${path.module}/k8s-manifests/service.yaml"

  acr_login_server = module.acr.login_server
  app_image_name   = local.app_image_name
  image_tag        = local.image_tag

  aks_kv_access_identity_id = module.aks.kv_access_identity_client_id

  key_vault_name = module.keyvault.name

  redis_hostname_secret_name = local.redis_hostname_secret_name
  redis_password_secret_name = local.redis_password_secret_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  depends_on = [
    module.aks,
    module.acr,
    module.aci_redis,
  ]
}