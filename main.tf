
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

module "avm-res-keyvault-vault_example_default" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.9.1"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  name                = var.keyvault_name
  enable_telemetry    = var.enable_telemetry
  tenant_id           = var.tenant_id
  contacts            = var.contacts
}

# This is the module call
# Do not specify location here due to the randomization above.
# Leaving location as `null` will cause the module to use the resource group location
# with a data source.
# module "avm-ptn-aks-production" {
#   source  = "Azure/avm-ptn-aks-production/azurerm"
#   version = "0.1.0"
#   kubernetes_version  = var.kubernetes_version
#   enable_telemetry    = var.enable_telemetry # see variables.tf
#   name                = var.name
#   resource_group_name = azurerm_resource_group.this.name
#   location            = var.location # Hardcoded instead of using module.regions because The "for_each" map includes keys derived from resource attributes that cannot be determined until apply, and so Terraform cannot determine the full set of keys that will identify the instances of this resource.
#   pod_cidr            = var.pod_cidr
#   node_cidr           = var.node_cidr
#   node_pools          = var.node_pools
# }
