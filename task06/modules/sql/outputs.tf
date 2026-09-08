output "sql_server_fqdn" {
  description = "Fully qualified domain name of the Azure SQL Server."
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "Sensitive ADO.NET SQL authentication connection string for the Azure SQL Database."
  sensitive   = true

  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.this.fully_qualified_domain_name,
    azurerm_mssql_database.this.name,
    var.sql_admin_username,
    random_password.sql_admin.result
  )
}