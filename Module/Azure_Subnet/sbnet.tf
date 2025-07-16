
resource "azurerm_subnet" "aafesbnt" {
  name                 = var.subnetname
  resource_group_name  = var.subnetrgname
  virtual_network_name = var.vnet_name
  address_prefixes     = var.addprefix
}

# resource "azurerm_subnet" "aabesbnt" {
#   name                 = "aabesbnt1"
#   resource_group_name  = "aamanrg"
#   virtual_network_name = azurerm_virtual_network.aavnet.name
#   address_prefixes     = ["10.0..0/24"]
# }