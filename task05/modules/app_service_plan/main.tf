resource "azurerm_service_plan" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  tags                = var.tags
}