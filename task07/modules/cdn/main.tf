resource "azurerm_cdn_frontdoor_profile" "this" {
  name                = var.profile_name
  resource_group_name = var.resource_group_name
  sku_name            = var.profile_sku
}

resource "azurerm_cdn_frontdoor_endpoint" "this" {
  name                     = var.endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id

  enabled = true
}

resource "azurerm_cdn_frontdoor_origin_group" "this" {
  name                     = var.origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id

  load_balancing {
    additional_latency_in_milliseconds = 50
    sample_size                        = 4
    successful_samples_required        = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "this" {
  name                          = var.origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id

  enabled = true

  host_name          = var.storage_account_primary_blob_host
  origin_host_header = var.storage_account_primary_blob_host

  http_port  = 80
  https_port = 443

  certificate_name_check_enabled = true

  priority = 1
  weight   = 500
}

resource "azurerm_cdn_frontdoor_route" "this" {
  name                          = var.route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.this.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.this.id]

  enabled = true

  patterns_to_match   = ["/*"]
  supported_protocols = ["Http", "Https"]

  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  link_to_default_domain = true

  cdn_frontdoor_origin_path = var.origin_path

  cache {
    query_string_caching_behavior = "IgnoreQueryString"
    compression_enabled           = false
  }
}