output "blob_url" {
  description = "URL of the application tar.gz blob used as the ACR build context."
  value       = azurerm_storage_blob.application.url
}

output "sas_token" {
  description = "SAS token that grants ACR read access to the application blob context."
  value       = data.azurerm_storage_account_blob_container_sas.application.sas
  sensitive   = true
}

output "storage_account_id" {
  description = "Resource ID of the Azure Storage Account."
  value       = azurerm_storage_account.this.id
}