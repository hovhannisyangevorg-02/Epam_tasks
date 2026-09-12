variable "name" {
  description = "Name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID used by the Key Vault."
  type        = string
}

variable "current_user_object_id" {
  description = "Object ID of the current Azure user receiving Key Vault secret permissions."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Azure Key Vault."
  type        = map(string)
}