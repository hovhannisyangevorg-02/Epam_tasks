resource "random_password" "redis" {
  length           = 24
  special          = true
  override_special = "_-"
}

resource "azurerm_container_group" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_address_type = "Public"
  dns_name_label  = var.name
  os_type         = "Linux"
  sku             = "Standard"

  container {
    name   = "redis"
    image  = "mcr.microsoft.com/cbl-mariner/base/redis:6.2"
    cpu    = "1"
    memory = "1.5"

    commands = [
      "redis-server",
      "--protected-mode",
      "no",
      "--requirepass",
      random_password.redis.result,
    ]

    ports {
      port     = 6379
      protocol = "TCP"
    }
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "hostname" {
  name         = var.hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "password" {
  name         = var.password_secret_name
  value        = random_password.redis.result
  key_vault_id = var.key_vault_id
}