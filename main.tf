#specifies provider configurations for the providers being used in this project
provider "azurerm" {
 features {}
 subscription_id = "d407f769-7b0c-4807-b509-5e96f3978c76"
 tenant_id       = "c4a3076e-e94c-4b3e-a9d9-de6baf0d3604"
 client_id       = "d4f2dfdd-e60a-4bef-a60b-5cda8918c359"
 client_secret   = "M9O8Q~TnYMcri5T2qFw4.fCuBI.mmNs8yMZGvaa8"
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
