variable "resource_groups" {
  description = "Map containing names and Azure locations for the three Resource Groups"

  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_services" {
  description = "Map containing Windows Web App and associated App Service Plan configuration"

  type = map(object({
    name               = string
    resource_group_key = string

    app_service_plan = object({
      name         = string
      sku_name     = string
      worker_count = number
    })
  }))
}

variable "traffic_manager" {
  description = "Configuration of the Azure Traffic Manager profile"

  type = object({
    name           = string
    routing_method = string
  })
}

variable "app_allow_ip_rule" {
  description = "Name of the Web App access restriction rule allowing the verification agent IP address"
  type        = string
}

variable "app_allow_tag_rule" {
  description = "Name of the Web App access restriction rule allowing the AzureTrafficManager service tag"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address of the verification agent allowed to access the Windows Web Apps"
  type        = string
}

variable "student_email" {
  description = "Student email address used as the Creator resource tag value"
  type        = string
}