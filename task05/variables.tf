variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    resource_group_key = string
    sku_name           = string
    worker_count       = number
  }))
}

variable "app_services" {
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager" {
  type = object({
    name           = string
    routing_method = string
  })
}

variable "app_allow_ip_rule" {
  type = string
}

variable "app_allow_tag_rule" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "student_email" {
  type = string
}