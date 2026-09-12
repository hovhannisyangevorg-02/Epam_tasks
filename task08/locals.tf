locals {
  rg_name       = "${var.name_prefix}-rg"
  aci_name      = "${var.name_prefix}-ci"
  acr_name      = replace("${var.name_prefix}cr", "-", "")
  aks_name      = "${var.name_prefix}-aks"
  keyvault_name = "${var.name_prefix}-kv"

  redis_name = "${var.name_prefix}-${var.redis_unique_suffix}-redis"

  app_image_name = "${var.name_prefix}-app"
  image_tag      = "latest"

  redis_hostname_secret_name = "redis-hostname"
  redis_key_secret_name      = "redis-primary-key"

  common_tags = {
    Creator = var.creator
  }
}