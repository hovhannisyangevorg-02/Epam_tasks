output "load_balancer_ip" {
  description = "Public Load Balancer IP address of the application deployed to AKS."
  value       = data.kubernetes_service_v1.app.status[0].load_balancer[0].ingress[0].ip
}