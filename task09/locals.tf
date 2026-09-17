locals {
  firewall_name    = "${var.name_prefix}-afw"
  route_table_name = "${var.name_prefix}-rt"

  firewall_ip_configuration_name = "${var.name_prefix}-afw-ipconfig"

  application_rule_collection_name = "${var.name_prefix}-arc"
  network_rule_collection_name     = "${var.name_prefix}-nrc"
  nat_rule_collection_name         = "${var.name_prefix}-natrc"
}