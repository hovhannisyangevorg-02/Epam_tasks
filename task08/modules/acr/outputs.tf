output "id" {
  description = "Resource ID of the Azure Container Registry."
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "Login server hostname of the Azure Container Registry."
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  description = "Administrative username of the Azure Container Registry."
  value       = azurerm_container_registry.this.admin_username
  sensitive   = true
}

output "admin_password" {
  description = "Administrative password of the Azure Container Registry."
  value       = azurerm_container_registry.this.admin_password
  sensitive   = true
}

output "build_run_id" {
  description = "Resource ID of the immediate Azure Container Registry task execution."
  value       = azurerm_container_registry_task_schedule_run_now.build.id
}