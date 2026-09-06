output "traffic_manager_fqdn" {
  description = "Fully qualified domain name of the Azure Traffic Manager profile."
  value       = module.traffic_manager.fqdn
}