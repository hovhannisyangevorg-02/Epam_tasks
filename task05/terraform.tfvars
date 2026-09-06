resource_groups = {
  rg1 = {
    name     = "cmaz-9y371ftl-mod5-rg-01"
    location = "West Europe"
  }

  rg2 = {
    name     = "cmaz-9y371ftl-mod5-rg-02"
    location = "North Europe"
  }

  rg3 = {
    name     = "cmaz-9y371ftl-mod5-rg-03"
    location = "France Central"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-9y371ftl-mod5-asp-01"
    resource_group_key = "rg1"
    sku_name           = "S1"
    worker_count       = 2
  }

  asp2 = {
    name               = "cmaz-9y371ftl-mod5-asp-02"
    resource_group_key = "rg2"
    sku_name           = "S1"
    worker_count       = 1
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-9y371ftl-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  }

  app2 = {
    name                 = "cmaz-9y371ftl-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

traffic_manager = {
  name           = "cmaz-9y371ftl-mod5-traf"
  routing_method = "Performance"
}

app_allow_ip_rule  = "allow-ip"
app_allow_tag_rule = "allow-tm"

allowed_ip_address = "18.153.146.156"

student_email = "gevorg_hovhannisyan@epam.com"