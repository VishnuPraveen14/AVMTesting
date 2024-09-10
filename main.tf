
## Section to provide a random Azure region for the resource group
# This allows us to randomize the region for the resource group.
# module "regions" {
#   source  = "Azure/regions/azurerm"
#   version = ">= 0.3.0"
# }

# This allows us to randomize the region for the resource group.
# resource "random_integer" "region_index" {
#   max = length(module.regions.regions) - 1
#   min = 0
# }
## End of section to provide a random Azure region for the resource group

# # This ensures we have unique CAF compliant names for our resources.
# module "naming" {
#   source  = "Azure/naming/azurerm"
#   version = ">= 0.3.0"
# }

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.resource_group_name
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

module "avm-res-keyvault-vault_secret" {
  source  = "Azure/avm-res-keyvault-vault/azurerm//modules/secret"
  version = "0.9.1"
  key_vault_resource_id = module.avm-res-keyvault-vault_example_default.resource_id
  name   = "mySecret"
  value  = "mySecretValue"
}