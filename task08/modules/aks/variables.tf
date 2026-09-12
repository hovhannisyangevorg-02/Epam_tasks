variable "name" {
  description = "Name of the Azure Kubernetes Service cluster."
  type        = string
}

variable "location" {
  description = "Azure region where the AKS cluster will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the AKS cluster."
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the Azure Container Registry that AKS is allowed to pull images from."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the Azure Key Vault accessed by the AKS Secrets Store CSI driver."
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID used for AKS Key Vault integration."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Azure Kubernetes Service cluster."
  type        = map(string)
}