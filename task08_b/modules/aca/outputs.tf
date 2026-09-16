output "fqdn" {
  description = "FQDN of the latest revision of the Azure Container App."
  value       = azurerm_container_app.this.latest_revision_fqdn
}

output "identity_id" {
  description = "Resource ID of the user-assigned identity used by the Azure Container App."
  value       = azurerm_user_assigned_identity.this.id
}