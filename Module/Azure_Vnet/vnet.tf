resource "azurerm_virtual_network" "aavnet" {
  name                = var.vnetname
  location            = var.vnetlocation
  resource_group_name = var.vnetresourcegroup
  address_space       = var.vnetaddressspace
}

