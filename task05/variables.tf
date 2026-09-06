variable "resource_groups" {
  description = "Map of Azure Resource Groups containing their names and locations."

  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of Azure App Service Plans containing their names, Resource Group keys, SKU names, and worker counts."

  type = map(object({
    name               = string
    resource_group_key = string
    sku_name           = string
    worker_count       = number
  }))
}

variable "app_services" {
  description = "Map of Windows Web Apps containing their names, Resource Group keys, and associated App Service Plan keys."

  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager" {
  description = "Azure Traffic Manager profile configuration."

  type = object({
    name           = string
    routing_method = string
  })
}

variable "app_allow_ip_rule" {
  description = "Name of the Web App access restriction rule that allows the verification agent IP address."
  type        = string
}

variable "app_allow_tag_rule" {
  description = "Name of the Web App access restriction rule that allows the AzureTrafficManager service tag."
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address of the verification agent that is allowed to access the Windows Web Apps."
  type        = string
}

variable "student_email" {
  description = "Student email address used as the Creator tag value on all required Azure resources."
  type        = string
}