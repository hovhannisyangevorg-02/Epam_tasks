variable "resource_group_name" {
  description = "Name of the Resource Group that contains the App Service resources."
  type        = string
}

variable "location" {
  description = "Azure region where the App Service Plan and Linux Web App are created."
  type        = string
}

variable "asp_name" {
  description = "Name of the Linux App Service Plan."
  type        = string
}

variable "asp_sku" {
  description = "SKU name of the Linux App Service Plan."
  type        = string
}

variable "app_name" {
  description = "Name of the Azure Linux Web App."
  type        = string
}

variable "app_dotnet_version" {
  description = "Dotnet runtime version configured for the Azure Linux Web App."
  type        = string
}

variable "sql_connection_string" {
  description = "Sensitive ADO.NET SQL authentication connection string passed from the SQL module."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags assigned to the App Service Plan and Linux Web App."
  type        = map(string)
}