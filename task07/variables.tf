variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name."
}

variable "resource_group_id" {
  type        = string
  description = "Existing Resource Group ID."
}

variable "storage_account_name" {
  type        = string
  description = "Existing Storage Account name."
}

variable "storage_account_id" {
  type        = string
  description = "Existing Storage Account ID."
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account tier."
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account replication type."
}

variable "storage_container_name" {
  type        = string
  description = "Name of the container containing blob.txt."
}

variable "cdn_profile_name" {
  type        = string
  description = "Azure Front Door profile name."
}

variable "cdn_profile_sku" {
  type        = string
  description = "Azure Front Door profile SKU."
}

variable "cdn_endpoint_name" {
  type        = string
  description = "Azure Front Door endpoint name."
}

variable "cdn_origin_group_name" {
  type        = string
  description = "Azure Front Door origin group name."
}

variable "cdn_origin_name" {
  type        = string
  description = "Azure Front Door origin name."
}

variable "cdn_route_name" {
  type        = string
  description = "Azure Front Door route name."
}