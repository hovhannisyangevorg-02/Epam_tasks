locals {
  rg_name        = "${var.name_prefix}-rg"
  redis_aci_name = "${var.name_prefix}-redis-ci"
  aca_env_name   = "${var.name_prefix}-cae"
  aca_name       = "${var.name_prefix}-ca"
  aks_name       = "${var.name_prefix}-aks"
  keyvault_name  = "${var.name_prefix}-kv"

  acr_name = replace("${var.name_prefix}cr", "-", "")
  sa_name  = replace("${var.name_prefix}sa", "-", "")

  storage_container_name = "app-content"
  archive_blob_name      = "app-content.tar.gz"
  app_image_name         = "${var.name_prefix}-app"
  image_tag              = "latest"

  redis_password_secret_name = "redis-password"
  redis_hostname_secret_name = "redis-hostname"

  common_tags = {
    Creator = var.creator
  }
}