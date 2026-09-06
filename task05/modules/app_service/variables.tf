variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_id" {
  type = string
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

variable "always_on" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}