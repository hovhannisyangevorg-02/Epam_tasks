locals {
  afw_name = "afw-${var.unique_id}"
  rt_name  = "rt-${var.unique_id}"

  application_rule_collection_name = "afw-app-${var.unique_id}"
  network_rule_collection_name     = "afw-net-${var.unique_id}"
  nat_rule_collection_name         = "afw-nat-${var.unique_id}"

  firewall_ip_configuration_name = "afw-ipconfig-${var.unique_id}"
}