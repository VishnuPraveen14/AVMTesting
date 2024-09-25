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
  resource_group_name = var.resource_group_name
}


module "avm-res-storage-storageaccount" {
  source                                  = "Azure/avm-res-storage-storageaccount/azurerm"
  version                                 = "0.2.7"
  name                                    = "satestlumenmsftv"
  resource_group_name                     = azurerm_resource_group.this.name
  location                                = var.location
  # account_tier                            = var.account_tier
  # account_replication_type                = var.account_replication_type
  # account_kind                            = var.account_kind
  # access_tier                             = var.access_tier
  # tags                                    = local.tags
  # public_network_access_enabled           = var.public_network_access_enabled
  # allow_nested_items_to_be_public         = var.sa_allow_nested_items_to_be_public
  # infrastructure_encryption_enabled       = var.sa_infrastructure_encryption_enabled
  shared_access_key_enabled               = true
  # enable_telemetry                        = var.enable_telemetry
  shares                                  = {
  share0 = {
    name        = "fileshare-1"
    quota       = 10
    access_tier = "Hot"
    metadata = {
      key1 = "value1"
      key2 = "value2"
    }
    signed_identifiers = [
      {
        id = "1"
        access_policy = {
          expiry_time = "2025-01-01T00:00:00Z"
          permission  = "r"
          start_time  = "2024-01-01T00:00:00Z"
        }
      }
    ]
  }
}
