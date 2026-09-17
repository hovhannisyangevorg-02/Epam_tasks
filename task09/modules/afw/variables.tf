variable "name_prefix" {
  description = "Common naming prefix used for Task 09 resources."
  type        = string
}

variable "location" {
  description = "Azure region for Azure Firewall resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing Resource Group."
  type        = string
}

variable "vnet_name" {
  description = "Name of the existing Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR address space of the existing Virtual Network."
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the existing AKS subnet."
  type        = string
}

variable "aks_subnet_address_space" {
  description = "CIDR address space of the existing AKS subnet."
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the existing AKS cluster."
  type        = string
}

variable "aks_loadbalancer_ip" {
  description = "Existing public IP address assigned to the AKS LoadBalancer."
  type        = string
}

variable "firewall_public_ip_name" {
  description = "Name of the Azure Firewall Public IP resource."
  type        = string
}

variable "firewall_name" {
  description = "Name of the Azure Firewall."
  type        = string
}

variable "firewall_ip_configuration_name" {
  description = "Name of the Azure Firewall IP configuration."
  type        = string
}

variable "route_table_name" {
  description = "Name of the Route Table associated with the AKS subnet."
  type        = string
}

variable "application_rule_collection_name" {
  description = "Name of the Azure Firewall application rule collection."
  type        = string
}

variable "network_rule_collection_name" {
  description = "Name of the Azure Firewall network rule collection."
  type        = string
}

variable "nat_rule_collection_name" {
  description = "Name of the Azure Firewall NAT rule collection."
  type        = string
}