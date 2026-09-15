variable "name" {
  description = "Name of the Azure Container App."
  type        = string
}

variable "environment_name" {
  description = "Name of the Azure Container App Environment."
  type        = string
}

variable "location" {
  description = "Azure region for the Container App resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Container App resources."
  type        = string
}

variable "acr_id" {
  description = "Resource ID of ACR used for the AcrPull role assignment."
  type        = string
}

variable "acr_login_server" {
  description = "Login server hostname of the Azure Container Registry."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault containing Redis secrets."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID used by the Container App Key Vault access policy."
  type        = string
}

variable "redis_hostname_secret_id" {
  description = "Key Vault secret ID containing the Redis hostname."
  type        = string
}

variable "redis_password_secret_id" {
  description = "Key Vault secret ID containing the Redis password."
  type        = string
}

variable "app_image_name" {
  description = "Application image repository name in ACR."
  type        = string
}

variable "image_tag" {
  description = "Application image tag deployed to Container Apps."
  type        = string
}

variable "tags" {
  description = "Tags applied to Container App resources."
  type        = map(string)
}