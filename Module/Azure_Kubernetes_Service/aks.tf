
resource "azurerm_kubernetes_cluster" "aaaksblock" {
  name                = var.aksname
  location            = var.akslocation
  resource_group_name = var.aksrg
  dns_prefix          = var.dnsprefix
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
