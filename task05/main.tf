locals {
  tags = {
    Creator = var.student_email
  }
}

module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = local.tags
}

module "app_service_plans" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name = each.value.name

  resource_group_name = module.resource_groups[
    each.value.resource_group_key
  ].name

  location = module.resource_groups[
    each.value.resource_group_key
  ].location

  sku_name     = each.value.sku_name
  worker_count = each.value.worker_count

  tags = local.tags
}

module "app_services" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name = each.value.name

  resource_group_name = module.resource_groups[
    each.value.resource_group_key
  ].name

  location = module.resource_groups[
    each.value.resource_group_key
  ].location

  service_plan_id = module.app_service_plans[
    each.value.app_service_plan_key
  ].id

  app_allow_ip_rule  = var.app_allow_ip_rule
  app_allow_tag_rule = var.app_allow_tag_rule
  allowed_ip_address = var.allowed_ip_address

  always_on = !contains(
    ["F1", "D1"],
    upper(
      var.app_service_plans[
        each.value.app_service_plan_key
      ].sku_name
    )
  )

  tags = local.tags
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name = var.traffic_manager.name

  resource_group_name = module.resource_groups["rg3"].name

  traffic_routing_method = var.traffic_manager.routing_method

  tags = local.tags

  endpoints = {
    for key, app in module.app_services : key => {
      name               = "${app.name}-endpoint"
      target_resource_id = app.id
      priority           = key == "app1" ? 1 : 2
      weight             = 1
    }
  }
}