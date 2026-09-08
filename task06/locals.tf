locals {
  rg_name         = format("%s-rg", var.name_prefix)
  sql_server_name = format("%s-sql", var.name_prefix)
  sql_db_name     = format("%s-sql-db", var.name_prefix)
  asp_name        = format("%s-asp", var.name_prefix)
  app_name        = format("%s-app", var.name_prefix)

  sql_admin_username = "sqladminuser"

  tags = {
    Creator = var.student_email
  }
}