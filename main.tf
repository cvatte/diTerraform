#specifies provider configurations for the providers being used in this project
provider "azurerm" {
 features {}
 subscription_id = ""
 tenant_id       = ""
 client_id       = ""
 client_secret   = ""
}

#specifies provider configurations for the providers being used in this project
# provider "azurerm" {
#   features {}
# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc_name
}
