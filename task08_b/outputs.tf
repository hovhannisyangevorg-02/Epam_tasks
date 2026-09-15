output "redis_fqdn" {
  description = "FQDN of Redis in Azure Container Instance."
  value       = module.aci_redis.fqdn
}

output "aca_fqdn" {
  description = "FQDN of the application deployed to Azure Container App."
  value       = module.aca.fqdn
}

output "aks_lb_ip" {
  description = "Load Balancer IP address of the application deployed to Azure Kubernetes Service."
  value       = module.k8s.load_balancer_ip
}