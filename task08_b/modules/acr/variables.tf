variable "name" {
  description = "Name of the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "Azure region for the Container Registry."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Container Registry."
  type        = string
}

variable "app_image_name" {
  description = "Docker image repository name built by the ACR task."
  type        = string
}

variable "image_tag" {
  description = "Docker image tag built and pushed by the ACR task."
  type        = string
}

variable "context_path" {
  description = "Storage blob URL containing the archived application build context."
  type        = string
}

variable "context_access_token" {
  description = "SAS token used by the ACR task to download the private blob context."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to the Azure Container Registry."
  type        = map(string)
}