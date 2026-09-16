variable "unique_id" {
  description = "Unique identifier used as the naming standard for resources created by Task 09."
  type        = string
}

variable "location" {
  description = "Azure region where the existing infrastructure and Azure Firewall resources are located."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group."
  type        = string
}

variable "vnet_name" {
  description = "Name of the existing Azure Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the existing Azure Virtual Network in CIDR notation."
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the existing subnet used by the AKS cluster."
  type        = string
}

variable "aks_subnet_address_space" {
  description = "Address space of the existing AKS subnet in CIDR notation."
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the existing Azure Kubernetes Service cluster."
  type        = string
}

variable "aks_loadbalancer_ip" {
  description = "Public IP address of the existing AKS LoadBalancer service."
  type        = string
}

variable "firewall_public_ip_name" {
  description = "Required name of the Azure Firewall Public IP resource."
  type        = string
}