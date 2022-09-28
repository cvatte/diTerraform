# specifies where state snapshots are stored
terraform {
 backend "azurerm" {
   resource_group_name  = "diyotta-tfstateRG"
   storage_account_name = "diytf"
   container_name       = "ditfstate"
   key                  = "diy.tfstate"
 }
}