resource "azurerm_service_plan" "this" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.asp_sku

  tags = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  https_only                    = true
  public_network_access_enabled = true

  site_config {
    application_stack {
      dotnet_version = var.app_dotnet_version
    }
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}