locals {
  storage_primary_blob_host = azurerm_storage_account.imported.primary_blob_host

  storage_origin_path = "/${var.storage_container_name}"
}