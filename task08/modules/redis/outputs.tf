output "hostname" {
  value = azurerm_redis_cache.this.hostname
}

output "primary_access_key" {
  value     = azurerm_redis_cache.this.primary_access_key
  sensitive = true
}

output "hostname_secret_id" {
  value = azurerm_key_vault_secret.hostname.id
}

output "primary_key_secret_id" {
  value = azurerm_key_vault_secret.primary_key.id
}