output "hostname" {
  description = "Hostname of the Azure Redis Cache instance."
  value       = azurerm_redis_cache.this.hostname
}

output "primary_access_key" {
  description = "Primary access key of the Azure Redis Cache instance."
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}

output "hostname_secret_id" {
  description = "Resource ID of the Key Vault secret containing the Redis hostname."
  value       = azurerm_key_vault_secret.hostname.id
}

output "primary_key_secret_id" {
  description = "Resource ID of the Key Vault secret containing the Redis primary access key."
  value       = azurerm_key_vault_secret.primary_key.id
}