import {
  to = azurerm_resource_group.imported
  id = var.resource_group_id
}

resource "azurerm_resource_group" "imported" {
  name     = var.resource_group_name
  location = var.location
}

import {
  to = azurerm_storage_account.imported
  id = var.storage_account_id
}

resource "azurerm_storage_account" "imported" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.imported.name
  location            = azurerm_resource_group.imported.location

  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
}

module "cdn" {
  source = "./modules/cdn"

  resource_group_name = azurerm_resource_group.imported.name

  storage_account_primary_blob_host = local.storage_primary_blob_host
  origin_path                       = local.storage_origin_path

  profile_name      = var.cdn_profile_name
  profile_sku       = var.cdn_profile_sku
  endpoint_name     = var.cdn_endpoint_name
  origin_group_name = var.cdn_origin_group_name
  origin_name       = var.cdn_origin_name
  route_name        = var.cdn_route_name
}