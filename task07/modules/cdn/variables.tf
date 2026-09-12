variable "resource_group_name" {
  type        = string
  description = "Resource Group containing the Front Door resources."
}

variable "storage_account_primary_blob_host" {
  type        = string
  description = "Primary Blob hostname of the Storage Account."
}

variable "origin_path" {
  type        = string
  description = "Container path used by the Front Door route."
}

variable "profile_name" {
  type        = string
  description = "Front Door profile name."
}

variable "profile_sku" {
  type        = string
  description = "Front Door profile SKU."
}

variable "endpoint_name" {
  type        = string
  description = "Front Door endpoint name."
}

variable "origin_group_name" {
  type        = string
  description = "Front Door origin group name."
}

variable "origin_name" {
  type        = string
  description = "Front Door origin name."
}

variable "route_name" {
  type        = string
  description = "Front Door route name."
}