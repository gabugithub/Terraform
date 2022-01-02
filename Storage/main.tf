variable "storage_account_name" {
    type=string
    default="genericstorage0101010"
}
 
variable "resource_group_name" {
    type=string
    default="terraform_grp1"
}
 
provider "azurerm"{
version = "=2.90.0"
features {}
}
 
resource "azurerm_resource_group" "grp" {
  name     = var.resource_group_name
  location = "North Europe"
}
 
resource "azurerm_storage_account" "store" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}