output "id" {
  description = "Resource ID of the Azure Key Vault."
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Name of the Azure Key Vault."
  value       = azurerm_key_vault.this.name
}