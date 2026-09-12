resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = true

  tags = var.tags
}

resource "azurerm_container_registry_task" "build" {
  name                  = "build-${var.app_image_name}"
  container_registry_id = azurerm_container_registry.this.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path = "Dockerfile"

    context_path = "${var.git_repo_url}#${var.git_branch}:task08/application"

    context_access_token = var.git_pat

    image_names = [
      "${var.app_image_name}:${var.image_tag}"
    ]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "build" {
  container_registry_task_id = azurerm_container_registry_task.build.id
}
