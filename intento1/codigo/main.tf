#Módulo 1
module "resource_group" {
  source                          = "../modulos/1-resource_group"

  name_rg                         = var.name_rg
  location                        = var.location
}

#Módulo 2
module "network" {
   source                         = "../modulos/2-network"
  #Recurso 1
  name_rg                         = module.resource_group.name_rg
  location                        = module.resource_group.location
  address_space                   = var.address_space
  #Recurso 2
  address_prefixes                = var.address_prefixes
}

#Módulo 3
module "contenedores" {
    source                        = "../modulos/3-contenedores"

  name_rg                         = module.resource_group.name_rg
  location                        = module.resource_group.location
  aks_dns_prefix                  = var.aks_dns_prefix
  #Node_pool
  aks_node_count                  = var.aks_node_count
  aks_vm_size                     = var.aks_vm_size
  subnet_id                       = module.network.subnet_id
  #identity
  type_identity                   = var.type_identity
}
