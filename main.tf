# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.resource_group_name
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

# module "avm-res-keyvault-vault_example_default" {
#   source  = "Azure/avm-res-keyvault-vault/azurerm"
#   version = "0.9.1"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.this.name
#   name                = var.keyvault_name
#   enable_telemetry    = var.enable_telemetry
#   tenant_id           = var.tenant_id
#   contacts            = var.contacts
# }

module "avm-res-keyvault-vault_example_default" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.9.1"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  name                = var.keyvault_name
  enable_telemetry    = var.enable_telemetry
  tenant_id           = var.tenant_id
}

module "hpavd" {
  source = "./modules/avd-hp-pe"
  enable_telemetry = var.enable_telemetry
  location = var.location
  
}

# module "avm-res-desktopvirtualization-hostpool_example_private-endpoint" {
#   source  = "Azure/avm-res-desktopvirtualization-hostpool/azurerm//examples/private-endpoint"
#   version = "0.2.1"
#   enable_telemetry = var.enable_telemetry
#   virtual_desktop_host_pool_name = "vdpool-avd-01"
#   virtual_desktop_host_pool_type = "Pooled"
#   virtual_desktop_host_pool_maximum_sessions_allowed = 10
#   virtual_desktop_host_pool_start_vm_on_connect = true
#   virtual_desktop_host_pool_load_balancer_type = "BreadthFirst"
# }


# module "avm-res-desktopvirtualization-applicationgroup" {
#   source  = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
#   version = "0.1.5"
#   virtual_desktop_application_group_host_pool_id = module.hpavd.resource_id
#   virtual_desktop_application_group_location = var.location
#   virtual_desktop_application_group_name = "vdag-avd-01"
#   virtual_desktop_application_group_type = "Desktop"
#   virtual_desktop_application_group_resource_group_name = azurerm_resource_group.this.name
# }

# module "avm-res-desktopvirtualization-applicationgroupremote" {
#   source  = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
#   version = "0.1.5"
#   virtual_desktop_application_group_host_pool_id = module.avm-res-desktopvirtualization-hostpool_example_private-endpoint.resource_id
#   virtual_desktop_application_group_location = var.location
#   virtual_desktop_application_group_name = "vdag-avd-02"
#   virtual_desktop_application_group_type = "RemoteApp"
#   virtual_desktop_application_group_resource_group_name = azurerm_resource_group.this.name
# }
# module "avd" {
#   source = "./modules/avd"
#   # source             = "Azure/avm-ptn-avd-lza-managementplane/azurerm"
#   enable_telemetry                                   = var.enable_telemetry
#   location                                           = azurerm_resource_group.this.location
#   resource_group_name                                = azurerm_resource_group.this.name
#   virtual_desktop_workspace_name                     = var.virtual_desktop_workspace_name
#   virtual_desktop_scaling_plan_time_zone             = var.virtual_desktop_scaling_plan_time_zone
#   virtual_desktop_scaling_plan_name                  = var.virtual_desktop_scaling_plan_name
#   virtual_desktop_host_pool_type                     = var.virtual_desktop_host_pool_type
#   virtual_desktop_host_pool_load_balancer_type       = var.virtual_desktop_host_pool_load_balancer_type
#   virtual_desktop_host_pool_name                     = var.virtual_desktop_host_pool_name
#   virtual_desktop_host_pool_maximum_sessions_allowed = var.virtual_desktop_host_pool_maximum_sessions_allowed
#   virtual_desktop_host_pool_start_vm_on_connect      = var.virtual_desktop_host_pool_start_vm_on_connect
#   virtual_desktop_application_group_type             = var.virtual_desktop_application_group_type
#   virtual_desktop_application_group_name             = var.virtual_desktop_application_group_name
#   virtual_desktop_host_pool_friendly_name            = var.virtual_desktop_host_pool_friendly_name
#   log_analytics_workspace_name                       = module.naming.log_analytics_workspace.name_unique
# }
