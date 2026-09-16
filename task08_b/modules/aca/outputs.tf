output "fqdn" {
  description = "Public FQDN of the Azure Container App."
  value       = azurerm_container_app.this.ingress[0].fqdn
}

output "identity_id" {
  description = "Resource ID of the user-assigned identity used by the Container App."
  value       = azurerm_user_assigned_identity.this.id
}