terraform {
  backend "azurerm" {
    resource_group_name  = "lumen-test-rg"
    storage_account_name = "tfbackendstrgacct12"
    container_name       = "terraformtest1"
    key                  = "terraform.tfstate"
  }
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.0.0"
    }
  }

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}