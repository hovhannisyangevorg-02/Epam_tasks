output "id" {
  description = "Resource ID of the Azure Container Registry."
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "Login server hostname of the Azure Container Registry."
  value       = azurerm_container_registry.this.login_server
}

output "build_run_id" {
  description = "Resource ID of the immediate ACR task execution."
  value       = azurerm_container_registry_task_schedule_run_now.build.id
}