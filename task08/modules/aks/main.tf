resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.name

  default_node_pool {
    name            = "system"
    node_count      = 1
    vm_size         = "Standard_D2ads_v6"
    os_disk_type    = "Ephemeral"
    os_disk_size_gb = 60
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"

  principal_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

resource "azurerm_key_vault_access_policy" "aks_csi" {
  key_vault_id = var.key_vault_id

  tenant_id = var.tenant_id

  object_id = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}