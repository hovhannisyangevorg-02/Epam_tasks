variable "name" {
  description = "Windows Web App name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the Windows Web App"
  type        = string
}

variable "location" {
  description = "Azure location of the Windows Web App"
  type        = string
}

variable "service_plan_id" {
  description = "Resource ID of the App Service Plan used by the Windows Web App"
  type        = string
}

variable "app_allow_ip_rule" {
  description = "Name of the access restriction rule allowing the verification agent IP"
  type        = string
}

variable "app_allow_tag_rule" {
  description = "Name of the access restriction rule allowing the AzureTrafficManager service tag"
  type        = string
}

variable "allowed_ip_address" {
  description = "Verification agent IP address allowed to access the Windows Web App"
  type        = string
}

variable "always_on" {
  description = "Controls whether the Windows Web App Always On feature is enabled"
  type        = bool
}

variable "tags" {
  description = "Tags assigned to the Windows Web App"
  type        = map(string)
}