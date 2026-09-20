locals {
  firewall_subnet_name = "AzureFirewallSubnet"

  # Existing VNet: 10.0.0.0/16
  # Existing AKS subnet: 10.0.0.0/24
  # Result for Firewall subnet: 10.0.1.0/26
  firewall_subnet_address_space = cidrsubnet(
    var.vnet_address_space,
    10,
    4
  )

  azure_region_service_tag = "AzureCloud.${replace(lower(var.location), " ", "")}"

  # NSG rule that allows traffic coming from Azure Firewall
  # to the existing AKS LoadBalancer.
  nsg_rule_name = "${var.name_prefix}-nsgsr"

  application_rules = {
    aks_required = {
      name             = "${var.name_prefix}-aks-app-rule"
      source_addresses = [var.aks_subnet_address_space]
      fqdn_tags        = ["AzureKubernetesService"]
    }
  }

  network_rules = {
    api_tcp = {
      name                  = "${var.name_prefix}-api-tcp"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = [local.azure_region_service_tag]
      destination_fqdns     = []
      destination_ports     = ["9000"]
    }

    api_udp = {
      name                  = "${var.name_prefix}-api-udp"
      protocols             = ["UDP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = [local.azure_region_service_tag]
      destination_fqdns     = []
      destination_ports     = ["1194"]
    }

    ntp = {
      name                  = "${var.name_prefix}-ntp"
      protocols             = ["UDP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns     = ["ntp.ubuntu.com"]
      destination_ports     = ["123"]
    }

    ghcr = {
      name                  = "${var.name_prefix}-ghcr"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns = [
        "ghcr.io",
        "pkg-containers.githubusercontent.com"
      ]
      destination_ports = ["443"]
    }

    docker = {
      name                  = "${var.name_prefix}-docker"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns = [
        "docker.io",
        "registry-1.docker.io",
        "production.cloudflare.docker.com"
      ]
      destination_ports = ["443"]
    }
  }

  routes = {
    default = {
      name                   = "${var.name_prefix}-default-route"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = azurerm_firewall.this.ip_configuration[0].private_ip_address
    }

    firewall_public_ip = {
      name                   = "${var.name_prefix}-afw-pip-route"
      address_prefix         = "${azurerm_public_ip.firewall.ip_address}/32"
      next_hop_type          = "Internet"
      next_hop_in_ip_address = null
    }
  }
}