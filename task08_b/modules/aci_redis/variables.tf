variable "name" {
  description = "Name of the Azure Container Instance hosting Redis."
  type        = string
}

variable "location" {
  description = "Azure region for the Redis container instance."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing Redis ACI."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault where Redis connection data is stored."
  type        = string
}

variable "hostname_secret_name" {
  description = "Name of the Key Vault secret used for the Redis hostname."
  type        = string
}

variable "password_secret_name" {
  description = "Name of the Key Vault secret used for the Redis password."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Redis container group."
  type        = map(string)
}