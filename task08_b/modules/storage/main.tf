data "archive_file" "application" {
  type        = "tar.gz"
  source_dir  = var.application_dir
  output_path = "${path.root}/app-content.tar.gz"
}

resource "time_static" "sas_start" {}

resource "time_offset" "sas_expiry" {
  base_rfc3339 = time_static.sas_start.rfc3339
  offset_hours = 24
}

resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "app_content" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "application" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.app_content.name
  type                   = "Block"
  source                 = data.archive_file.application.output_path
}

data "azurerm_storage_account_blob_container_sas" "application" {
  connection_string = azurerm_storage_account.this.primary_connection_string
  container_name    = azurerm_storage_container.app_content.name
  https_only        = true

  start  = time_static.sas_start.rfc3339
  expiry = time_offset.sas_expiry.rfc3339

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = true
  }

  depends_on = [
    azurerm_storage_blob.application
  ]
}