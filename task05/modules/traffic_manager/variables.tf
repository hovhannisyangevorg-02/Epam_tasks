variable "name" {
  description = "Name of the Azure Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group that contains the Traffic Manager profile."
  type        = string
}

variable "traffic_routing_method" {
  description = "Traffic routing method used by the Traffic Manager profile."
  type        = string
}

variable "endpoints" {
  description = "Map of Azure resources configured as Traffic Manager endpoints."

  type = map(object({
    name               = string
    target_resource_id = string
    weight             = number
    priority           = number
  }))
}

variable "tags" {
  description = "Tags assigned to the Azure Traffic Manager profile."
  type        = map(string)
}