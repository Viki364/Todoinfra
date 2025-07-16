module "rg" {
  source     = "../Module/Azure_Resource_Group"
  rgname     = "aargname"
  rglocation = "Central US"
}


module "Vnet" {
  depends_on = [module.rg]

  source            = "../Module/Azure_Vnet"
  vnetname          = "aavnet"
  vnetlocation      = "Central Us"
  vnetresourcegroup = "aargname"
  vnetaddressspace  = ["10.0.0.0/16"]
}

module "FeSubnet" {
  depends_on   = [module.Vnet]
  source       = "../Module/Azure_Subnet"
  subnetname   = "aafesbnt"
  subnetrgname = "aargname"
  vnet_name    = "aavnet"
  addprefix    = ["10.0.1.0/24"]
}

module "BeSubnet" {
  depends_on   = [module.Vnet]
  source       = "../Module/Azure_Subnet"
  subnetname   = "aabesbnt"
  subnetrgname = "aargname"
  vnet_name    = "aavnet"
  addprefix    = ["10.0.2.0/24"]
}


module "Pip" {
  depends_on  = [module.rg]
  source      = "../Module/Azure_PIP"
  Pipname     = "aapip"
  PipLocation = "Central Us"
  PipRgName   = "aargname"
}

module "fevm" {

  source             = "../Module/Azure_linux_vm"
  nicname            = "aafenic"
  niclocation        = "Central Us"
  nicrgname          = "aargname"
  ipsubnetid         = "/subscriptions/4a8882d8-040a-43b9-81c8-844e324752c0/resourceGroups/aargname/providers/Microsoft.Network/virtualNetworks/aavnet/subnets/aafesbnt"
  vmname             = "aafevm"
  vmlocation         = "central Us"
  vmsize             = "Standard_D2s_v3"
  vmrgname           = "aargname"
  vmadminpass        = "Vikr@nt5356"
  vmadminusername    = "admin"
  vmimagepublisherid = "canonical"
  vmimageofferid     = "0001-com-ubuntu-server-jammy"
  vmimageskuplanid   = "22_04-lts"
  vmimageversion     = "latest"


}


module "bevm" {

  source             = "../Module/Azure_linux_vm"
  nicname            = "aabenic"
  niclocation        = "Central Us"
  nicrgname          = "aargname"
  ipsubnetid         = "/subscriptions/4a8882d8-040a-43b9-81c8-844e324752c0/resourceGroups/aargname/providers/Microsoft.Network/virtualNetworks/aavnet/subnets/aabesbnt"
  vmname             = "aafevm"
  vmlocation         = "central Us"
  vmsize             = "Standard_D2s_v3"
  vmrgname           = "aargname"
  vmadminpass        = "Vikr@nt5356"
  vmadminusername    = "admin"
  vmimagepublisherid = "canonical"
  vmimageofferid     = "0001-com-ubuntu-server-focal"
  vmimageskuplanid   = "20_04-lts"
  vmimageversion     = "latest"


}