variable "resource_group_name" {
  description = "Name of the Resource Group that contains the Azure SQL resources."
  type        = string
}

variable "location" {
  description = "Azure region where the Azure SQL resources are created."
  type        = string
}

variable "sql_server_name" {
  description = "Name of the Azure SQL logical server."
  type        = string
}

variable "sql_db_name" {
  description = "Name of the Azure SQL Database."
  type        = string
}

variable "sql_sku" {
  description = "SKU name of the Azure SQL Database."
  type        = string
}

variable "sql_admin_username" {
  description = "Administrator username used for SQL authentication."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault secret name used to store the SQL administrator username."
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault secret name used to store the generated SQL administrator password."
  type        = string
}

variable "key_vault_id" {
  description = "Resource ID of the existing Azure Key Vault."
  type        = string
}

variable "sql_fwr_name" {
  description = "Name of the SQL firewall rule that allows the verification agent IP address."
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to connect directly to the Azure SQL Server."
  type        = string
}

variable "tags" {
  description = "Tags assigned to Azure resources that support tags in the SQL module."
  type        = map(string)
}