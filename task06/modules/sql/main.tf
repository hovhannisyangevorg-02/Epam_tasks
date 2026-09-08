resource "random_password" "sql_admin" {
  length           = 24
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  override_special = "!@#$%&*_-+="
}

resource "azurerm_mssql_server" "this" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.sql_admin_username
  administrator_login_password  = random_password.sql_admin.result
  public_network_access_enabled = true

  tags = var.tags
}

resource "azurerm_mssql_database" "this" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.this.id
  sku_name  = var.sql_sku

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "verification_agent" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.sql_admin_secret_name
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_secret_password
  value        = random_password.sql_admin.result
  key_vault_id = var.key_vault_id

  tags = var.tags
}