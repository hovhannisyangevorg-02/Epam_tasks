variable "name" {
  description = "Name of the Azure Redis Cache."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault."
  type        = string
}

variable "hostname_secret_name" {
  description = "Key Vault secret name for Redis hostname."
  type        = string
}

variable "primary_key_secret_name" {
  description = "Key Vault secret name for Redis primary key."
  type        = string
}

variable "tags" {
  description = "Tags applied to Redis."
  type        = map(string)
}