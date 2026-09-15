variable "name" {
  description = "Name of the Azure Kubernetes Service cluster."
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the AKS cluster."
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the ACR registry that AKS must pull images from."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault read by the AKS CSI identity."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID used by the Key Vault access policy."
  type        = string
}

variable "tags" {
  description = "Tags applied to the AKS cluster."
  type        = map(string)
}