output "id" {
  description = "Resource ID of the Azure Windows Web App."
  value       = azurerm_windows_web_app.this.id
}

output "name" {
  description = "Name of the Azure Windows Web App."
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the Azure Windows Web App."
  value       = azurerm_windows_web_app.this.default_hostname
}