locals {
  firewall_subnet_name = "AzureFirewallSubnet"

  # Azure Firewall needs at least a /26 subnet.
  # Place it at the end of the existing VNet to reduce the chance
  # of overlapping the existing AKS subnet.
  vnet_prefix_length = tonumber(split("/", var.vnet_address_space)[1])

  firewall_subnet_newbits = 26 - local.vnet_prefix_length

  firewall_subnet_netnum = pow(
    2,
    local.firewall_subnet_newbits
  ) - 1

  firewall_subnet_address_space = cidrsubnet(
    var.vnet_address_space,
    local.firewall_subnet_newbits,
    local.firewall_subnet_netnum
  )

  azure_region_service_tag = "AzureCloud.${replace(lower(var.location), " ", "")}"

  application_rules = {
    aks_required = {
      name             = "allow-aks-required"
      source_addresses = [var.aks_subnet_address_space]
      fqdn_tags        = ["AzureKubernetesService"]
    }
  }

  network_rules = {
    api_tcp = {
      name                  = "allow-api-tcp"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = [local.azure_region_service_tag]
      destination_fqdns     = []
      destination_ports     = ["9000"]
    }

    api_udp = {
      name                  = "allow-api-udp"
      protocols             = ["UDP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = [local.azure_region_service_tag]
      destination_fqdns     = []
      destination_ports     = ["1194"]
    }

    ntp = {
      name                  = "allow-ntp"
      protocols             = ["UDP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns     = ["ntp.ubuntu.com"]
      destination_ports     = ["123"]
    }

    ghcr = {
      name                  = "allow-ghcr"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns = [
        "ghcr.io",
        "pkg-containers.githubusercontent.com",
      ]
      destination_ports = ["443"]
    }

    docker = {
      name                  = "allow-docker"
      protocols             = ["TCP"]
      source_addresses      = [var.aks_subnet_address_space]
      destination_addresses = []
      destination_fqdns = [
        "docker.io",
        "registry-1.docker.io",
        "production.cloudflare.docker.com",
      ]
      destination_ports = ["443"]
    }
  }
}