terraform {
  backend "azurerm" {
    resource_group_name   = "vishnuDemo"
    storage_account_name  = "vishnudemo9934"
    container_name        = "test"
    key                   = "terraform.tfstate"
  }
}