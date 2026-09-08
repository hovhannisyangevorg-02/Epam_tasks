resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

data "azurerm_key_vault" "existing" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

module "sql" {
  source = "./modules/sql"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sql_server_name = local.sql_server_name
  sql_db_name     = local.sql_db_name
  sql_sku         = var.sql_sku

  sql_admin_username        = local.sql_admin_username
  sql_admin_secret_name     = var.sql_admin_secret_name
  sql_admin_secret_password = var.sql_admin_secret_password

  key_vault_id       = data.azurerm_key_vault.existing.id
  sql_fwr_name       = var.sql_fwr_name
  allowed_ip_address = var.allowed_ip_address

  tags = local.tags
}

module "webapp" {
  source = "./modules/webapp"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  asp_name           = local.asp_name
  asp_sku            = var.asp_sku
  app_name           = local.app_name
  app_dotnet_version = var.app_dotnet_version

  sql_connection_string = module.sql.sql_connection_string

  tags = local.tags
}