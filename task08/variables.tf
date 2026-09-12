variable "name_prefix" {
  description = "Common naming prefix used to generate Azure resource names."
  type        = string
  default     = "cmtr-9y371ftl-mod8"
}

variable "redis_unique_suffix" {
  description = "Unique numeric suffix required for the Azure Redis Cache resource name."
  type        = string
  default     = "1789225950"
}

variable "location" {
  description = "Azure region where all resources will be deployed."
  type        = string
  default     = "West Europe"
}

variable "creator" {
  description = "Creator value applied to the required Azure resources as a tag."
  type        = string
  default     = "gevorg_hovhannisyan@epam.com"
}

variable "git_repo_url" {
  description = "HTTPS URL of the Git repository containing the task08 application source code."
  type        = string
}

variable "git_branch" {
  description = "Git branch containing the application source code used by the Azure Container Registry task."
  type        = string
  default     = "main"
}

variable "git_pat" {
  description = "Git Personal Access Token used by the Azure Container Registry task to access the source repository."
  type        = string
  sensitive   = true
}