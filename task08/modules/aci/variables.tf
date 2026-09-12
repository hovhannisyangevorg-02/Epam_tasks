variable "name" {
  description = "Name of the Azure Container Instance container group."
  type        = string
}

variable "location" {
  description = "Azure region where the Azure Container Instance will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Azure Container Instance."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Azure Container Instance."
  type        = map(string)
}

variable "image" {
  description = "Fully qualified Docker image reference deployed to Azure Container Instance."
  type        = string
}

variable "acr_server" {
  description = "Azure Container Registry login server used by Azure Container Instance."
  type        = string
}

variable "acr_username" {
  description = "Azure Container Registry username used to pull the application image."
  type        = string
  sensitive   = true
}

variable "acr_password" {
  description = "Azure Container Registry password used to pull the application image."
  type        = string
  sensitive   = true
}

variable "redis_hostname" {
  description = "Redis hostname supplied to the application as a secure environment variable."
  type        = string
  sensitive   = true
}

variable "redis_primary_key" {
  description = "Redis primary access key supplied to the application as a secure environment variable."
  type        = string
  sensitive   = true
}

variable "dns_name_label" {
  description = "Public DNS name label assigned to the Azure Container Instance."
  type        = string
}