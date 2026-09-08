variable "name_prefix" {
  description = "Common resource name prefix used by locals.tf to build the required Azure resource names."
  type        = string
}

variable "location" {
  description = "Azure region where the new task resources are deployed."
  type        = string
}

variable "kv_rg_name" {
  description = "Name of the existing Resource Group that contains the Azure Key Vault."
  type        = string
}

variable "kv_name" {
  description = "Name of the existing Azure Key Vault used to store SQL administrator credentials."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Name of the Key Vault secret used to store the SQL administrator username."
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Name of the Key Vault secret used to store the generated SQL administrator password."
  type        = string
}

variable "sql_sku" {
  description = "SKU name of the Azure SQL Database."
  type        = string
}

variable "sql_fwr_name" {
  description = "Name of the SQL Server firewall rule that allows the verification agent IP address."
  type        = string
}

variable "asp_sku" {
  description = "SKU name of the Linux App Service Plan."
  type        = string
}

variable "app_dotnet_version" {
  description = "Dotnet runtime version configured for the Azure Linux Web App."
  type        = string
}

variable "student_email" {
  description = "Student email address used as the Creator tag value."
  type        = string
}

variable "allowed_ip_address" {
  description = "Public IP address allowed to connect directly to the Azure SQL Server."
  type        = string
}