variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "traffic_routing_method" {
  type = string
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number, 1)
    priority           = optional(number)
    geo_mappings       = optional(list(string))
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}