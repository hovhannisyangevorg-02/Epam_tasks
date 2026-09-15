variable "name" {
  description = "Name of the Azure Storage Account."
  type        = string
}

variable "location" {
  description = "Azure region for the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Storage Account."
  type        = string
}

variable "container_name" {
  description = "Name of the private blob container used for application content."
  type        = string
}

variable "blob_name" {
  description = "Name of the tar.gz application archive blob."
  type        = string
}

variable "application_dir" {
  description = "Path to the application directory that must be archived."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Storage Account."
  type        = map(string)
}