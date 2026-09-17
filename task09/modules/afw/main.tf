data "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "firewall" {
  name                 = local.firewall_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name

  address_prefixes = [
    local.firewall_subnet_address_space
  ]
}

resource "azurerm_public_ip" "firewall" {
  name                = var.firewall_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "this" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  dns_proxy_enabled = true

  ip_configuration {
    name                 = var.firewall_ip_configuration_name
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

resource "azurerm_route_table" "aks" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = true

  dynamic "route" {
    for_each = local.routes

    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
}

resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = data.azurerm_subnet.aks.id
  route_table_id = azurerm_route_table.aks.id
}

resource "azurerm_firewall_application_rule_collection" "aks" {
  name                = var.application_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name

  priority = 200
  action   = "Allow"

  dynamic "rule" {
    for_each = local.application_rules

    content {
      name             = rule.value.name
      source_addresses = rule.value.source_addresses
      fqdn_tags        = rule.value.fqdn_tags
    }
  }
}

resource "azurerm_firewall_network_rule_collection" "aks" {
  name                = var.network_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name

  priority = 100
  action   = "Allow"

  dynamic "rule" {
    for_each = local.network_rules

    content {
      name             = rule.value.name
      protocols        = rule.value.protocols
      source_addresses = rule.value.source_addresses

      destination_addresses = length(rule.value.destination_addresses) > 0 ? rule.value.destination_addresses : null
      destination_fqdns     = length(rule.value.destination_fqdns) > 0 ? rule.value.destination_fqdns : null
      destination_ports     = rule.value.destination_ports
    }
  }
}

resource "azurerm_firewall_nat_rule_collection" "nginx" {
  name                = var.nat_rule_collection_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name

  priority = 100
  action   = "Dnat"

  rule {
    name = "${var.name_prefix}-nginx-dnat"

    source_addresses = ["*"]

    destination_addresses = [
      azurerm_public_ip.firewall.ip_address
    ]

    destination_ports = [
      "80"
    ]

    protocols = [
      "TCP"
    ]

    translated_address = var.aks_loadbalancer_ip
    translated_port    = "80"
  }
}