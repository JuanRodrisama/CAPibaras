# Crea el clúster de AKS
resource "azurerm_kubernetes_cluster" "container" {
  name                = "${var.name_rg}-container"
  location            = var.location
  resource_group_name = var.name_rg
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name            = "${var.name_rg}-node_pool"
    node_count      = var.aks_node_count #Cantidad de "MV"
    vm_size         = var.aks_vm_size #"Standard_A2" 2 nucleo 3.5 gb ram
    vnet_subnet_id  = var.subnet_id
  }

  identity {
    type = var.type_identity
  }
}

