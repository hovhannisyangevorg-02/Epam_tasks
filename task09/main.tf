module "afw" {
  source = "./modules/afw"

  name_prefix = var.name_prefix

  location            = var.location
  resource_group_name = var.resource_group_name

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  aks_subnet_name          = var.aks_subnet_name
  aks_subnet_address_space = var.aks_subnet_address_space

  aks_cluster_name = var.aks_cluster_name

  aks_loadbalancer_ip = var.aks_loadbalancer_ip

  firewall_public_ip_name = var.firewall_public_ip_name

  firewall_name                  = local.firewall_name
  firewall_ip_configuration_name = local.firewall_ip_configuration_name

  route_table_name = local.route_table_name

  application_rule_collection_name = local.application_rule_collection_name
  network_rule_collection_name     = local.network_rule_collection_name
  nat_rule_collection_name         = local.nat_rule_collection_name
}