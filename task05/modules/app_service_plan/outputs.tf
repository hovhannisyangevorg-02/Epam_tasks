output "id" {
  description = "Resource ID of the Azure App Service Plan."
  value       = azurerm_service_plan.this.id
}

output "name" {
  description = "Name of the Azure App Service Plan."
  value       = azurerm_service_plan.this.name
}

output "location" {
  description = "Location of the Azure App Service Plan."
  value       = azurerm_service_plan.this.location
}