output "fqdn" {
  description = "Fully qualified domain name of Redis in Azure Container Instance."
  value       = azurerm_container_group.redis.fqdn
}

output "ip_address" {
  description = "Public IP address of Redis in Azure Container Instance."
  value       = azurerm_container_group.redis.ip_address
}

output "hostname_secret_id" {
  description = "Versioned Key Vault secret ID containing the Redis hostname."
  value       = azurerm_key_vault_secret.hostname.id
}

output "password_secret_id" {
  description = "Versioned Key Vault secret ID containing the Redis password."
  value       = azurerm_key_vault_secret.password.id
}