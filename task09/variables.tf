variable "name_prefix" {
  description = "Naming prefix used for all resources created by Task 09."
  type        = string
}

variable "location" {
  description = "Azure region where Firewall resources will be created."
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
  description = "CIDR address space of the existing Azure Virtual Network."
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
  description = "Name of the existing Azure Kubernetes Service cluster."
  type        = string
}

variable "aks_loadbalancer_ip" {
  description = "Public IP address of the existing AKS LoadBalancer."
  type        = string
}

variable "firewall_public_ip_name" {
  description = "Name of the Public IP assigned to Azure Firewall."
  type        = string
}