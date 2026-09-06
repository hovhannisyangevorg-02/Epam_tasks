locals {
  verification_ip_cidr = can(regex("/", var.allowed_ip_address)) ? var.allowed_ip_address : "${var.allowed_ip_address}/32"

  access_restrictions = [
    {
      name        = var.app_allow_ip_rule
      priority    = 100
      action      = "Allow"
      ip_address  = local.verification_ip_cidr
      service_tag = null
    },
    {
      name        = var.app_allow_tag_rule
      priority    = 110
      action      = "Allow"
      ip_address  = null
      service_tag = "AzureTrafficManager"
    }
  ]
}

resource "azurerm_windows_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  tags = var.tags

  site_config {
    always_on = var.always_on

    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = local.access_restrictions

      content {
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = ip_restriction.value.action
        ip_address  = ip_restriction.value.ip_address
        service_tag = ip_restriction.value.service_tag
      }
    }
  }
}