


resource "azurerm_network_interface" "aanic" {
  name                = var.nicname
  location            = var.niclocation
  resource_group_name = var.nicrgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.ipsubnetid
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vmname
  resource_group_name = var.vmrgname
  location            = var.vmlocation
  size                = var.vmsize
  admin_username      = var.vmadminusername
  admin_password      = var.vmadminpass
  
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vmimagepublisherid
    offer     = var.vmimageofferid
    sku       = var.vmimageskuplanid
    version   = var.vmimageversion
  }
}