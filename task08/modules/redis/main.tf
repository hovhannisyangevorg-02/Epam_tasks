resource "azurerm_redis_cache" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  capacity = 2
  family   = "C"
  sku_name = "Basic"

  non_ssl_port_enabled = false
  minimum_tls_version  = "1.2"

  redis_configuration {
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "hostname" {
  name         = var.hostname_secret_name
  value        = azurerm_redis_cache.this.hostname
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "primary_key" {
  name         = var.primary_key_secret_name
  value        = azurerm_redis_cache.this.primary_access_key
  key_vault_id = var.key_vault_id
}