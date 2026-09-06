output "id" {
  description = "Resource ID of the Azure Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.id
}

output "fqdn" {
  description = "Fully qualified domain name of the Azure Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.fqdn
}