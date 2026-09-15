variable "name" {
  description = "Name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID used by the Key Vault."
  type        = string
}

variable "current_user_object_id" {
  description = "Object ID of the current user that receives full secret permissions."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Key Vault."
  type        = map(string)
}