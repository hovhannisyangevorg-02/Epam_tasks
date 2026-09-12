variable "name" {
  description = "Name of the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "Azure region where the Container Registry will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Container Registry."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Azure Container Registry."
  type        = map(string)
}

variable "app_image_name" {
  description = "Name of the Docker image built by the Azure Container Registry task."
  type        = string
}

variable "image_tag" {
  description = "Docker image tag produced by the Azure Container Registry task."
  type        = string
}

variable "git_repo_url" {
  description = "HTTPS URL of the Git repository containing the application Dockerfile."
  type        = string
}

variable "git_branch" {
  description = "Git branch used as the source for the Azure Container Registry build task."
  type        = string
}

variable "git_pat" {
  description = "Git Personal Access Token used by the Azure Container Registry task to access the source repository."
  type        = string
  sensitive   = true
}