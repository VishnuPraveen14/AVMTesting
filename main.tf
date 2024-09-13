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
# }

module "hpavd" {
  source = "./modules/avd-hp-pe"
  enable_telemetry = var.enable_telemetry
  location = var.location
}


module "avm-res-desktopvirtualization-applicationgroup" {
  source  = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version = "0.1.5"
  virtual_desktop_application_group_host_pool_id = module.hpavd.hostpool_id
  virtual_desktop_application_group_location = var.location
  virtual_desktop_application_group_name = "vdag-avd-01"
  virtual_desktop_application_group_type = "Desktop"
  virtual_desktop_application_group_resource_group_name = azurerm_resource_group.this.name
}

module "avm-res-desktopvirtualization-applicationgroupremote" {
  source  = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version = "0.1.5"
  virtual_desktop_application_group_host_pool_id = module.hpavd.hostpool_id
  virtual_desktop_application_group_location = var.location
  virtual_desktop_application_group_name = "vdag-avd-02"
  virtual_desktop_application_group_type = "RemoteApp"
  virtual_desktop_application_group_resource_group_name = azurerm_resource_group.this.name
}

module "avm-res-desktopvirtualization-workspace" {
  source  = "Azure/avm-res-desktopvirtualization-workspace/azurerm"
  version = "0.1.5"
  # insert the 4 required variables here
  virtual_desktop_workspace_location = var.location
  resource_group_name = azurerm_resource_group.this.name
  virtual_desktop_workspace_name = "vdws-avd-01"
  virtual_desktop_workspace_resource_group_name = azurerm_resource_group.this.name

}

module "avm-res-storage-storageaccount_example_private-endpoint-manage_dns_zone_group" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm//examples/private-endpoint-manage_dns_zone_group"
  version = "0.2.6"
}