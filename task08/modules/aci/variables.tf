variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "image" {
  type = string
}

variable "acr_server" {
  type = string
}

variable "acr_username" {
  type      = string
  sensitive = true
}

variable "acr_password" {
  type      = string
  sensitive = true
}

variable "redis_hostname" {
  type      = string
  sensitive = true
}

variable "redis_primary_key" {
  type      = string
  sensitive = true
}

variable "dns_name_label" {
  type = string
}