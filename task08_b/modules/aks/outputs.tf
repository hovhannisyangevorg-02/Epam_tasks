output "id" {
  description = "Resource ID of the Azure Kubernetes Service cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "host" {
  description = "Kubernetes API server endpoint for the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive   = true
}

output "client_certificate" {
  description = "Client certificate for authenticating to the AKS API server."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client private key for authenticating to the AKS API server."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Certificate authority data for validating the AKS API server."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "kv_access_identity_client_id" {
  description = "Client ID of the AKS Key Vault Secrets Store CSI managed identity."
  value       = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].client_id
}