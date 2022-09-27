#specifies provider configurations for the providers being used in this project
provider "azurerm" {
 features {}
 subscription_id = "fa10a517-9a3c-4c52-8044-1ca114e4e2d7"
 tenant_id       = "vJ48Q~Jnsudf-mcrhqRQ4zWdYm7mlS4uBpnaTduM"
 client_id       = "50f9a49e-4e73-47a1-9b1a-d85dd8573c98"
 client_secret   = "ab6cd02b-10c4-4eff-90a4-2fe85f611aac"
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
