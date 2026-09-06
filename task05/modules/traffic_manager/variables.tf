variable "name" {
  description = "Traffic Manager profile name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the Traffic Manager profile"
  type        = string
}

variable "traffic_routing_method" {
  description = "Traffic routing method used by the Traffic Manager profile"
  type        = string
}

variable "endpoints" {
  description = "Map of Azure resources configured as Traffic Manager endpoints"

  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number, 1)
    priority           = optional(number)
  }))
}

variable "tags" {
  description = "Tags assigned to the Traffic Manager profile"
  type        = map(string)
}