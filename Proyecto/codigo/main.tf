#Módulo 2
module "network" {
   source                         = "../modulos/1-network"
  #Recurso 1
  name_rg                         = var.name_rg
  location                        = var.location
  address_space                   = var.address_space
  #Recurso 2
  address_prefixes                = var.address_prefixes
}

#Módulo 3
module "contenedores" {
    source                        = "../modulos/2-contenedores"

  name_rg                         = module.network.name_rg
  location                        = module.network.location
  aks_dns_prefix                  = var.aks_dns_prefix
  #Node_pool
  aks_node_count                  = var.aks_node_count
  aks_vm_size                     = var.aks_vm_size
  subnet_id                       = module.network.subnet_id
  #identity
  type_identity                   = var.type_identity
}
