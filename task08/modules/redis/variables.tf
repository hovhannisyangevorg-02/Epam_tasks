variable "name" {
  description = "Name of the Azure Redis Cache instance."
  type        = string
}

variable "location" {
  description = "Azure region where Redis Cache will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing Redis Cache."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault where Redis credentials will be stored."
  type        = string
}

variable "hostname_secret_name" {
  description = "Name of the Key Vault secret used to store the Redis hostname."
  type        = string
}

variable "primary_key_secret_name" {
  description = "Name of the Key Vault secret used to store the Redis primary access key."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Azure Redis Cache instance."
  type        = map(string)
}