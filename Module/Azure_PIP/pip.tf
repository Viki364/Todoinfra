
resource "azurerm_public_ip" "aapip" {
  name                = var.Pipname
  resource_group_name = var.PipRgName
  location            = var.PipLocation
  allocation_method   = "Static"

}