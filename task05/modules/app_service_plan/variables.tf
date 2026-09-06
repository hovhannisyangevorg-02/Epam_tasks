variable "name" {
  description = "App Service Plan name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group containing the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure location of the App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "Number of worker instances for the App Service Plan"
  type        = number
}

variable "tags" {
  description = "Tags assigned to the App Service Plan"
  type        = map(string)
}