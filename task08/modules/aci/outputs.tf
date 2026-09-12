output "fqdn" {
  description = "Fully qualified domain name of the Azure Container Instance."
  value       = azurerm_container_group.this.fqdn
}

output "ip_address" {
  description = "Public IP address of the Azure Container Instance."
  value       = azurerm_container_group.this.ip_address
}