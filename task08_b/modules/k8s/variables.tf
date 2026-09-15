variable "deployment_template_path" {
  description = "Path to the Kubernetes Deployment Terraform template."
  type        = string
}

variable "secret_provider_template_path" {
  description = "Path to the Kubernetes SecretProviderClass Terraform template."
  type        = string
}

variable "service_manifest_path" {
  description = "Path to the Kubernetes LoadBalancer Service YAML manifest."
  type        = string
}

variable "acr_login_server" {
  description = "Login server hostname of the Azure Container Registry."
  type        = string
}

variable "app_image_name" {
  description = "Application image repository name in Azure Container Registry."
  type        = string
}

variable "image_tag" {
  description = "Application image tag deployed to AKS."
  type        = string
}

variable "aks_kv_access_identity_id" {
  description = "Client ID of the AKS managed identity used by the Key Vault CSI provider."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault containing Redis secrets."
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Name of the Key Vault secret containing the Redis hostname."
  type        = string
}

variable "redis_password_secret_name" {
  description = "Name of the Key Vault secret containing the Redis password."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID used by the SecretProviderClass."
  type        = string
}