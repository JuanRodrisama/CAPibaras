#Modulo 01
module "resource_group" {
  source = "../modulos/01.-resource_group"

  location    = var.location
  prefix      = module.generador.prefix
}

#Modulo 02
module "network" {
  source = "../modulos/02.-network"

  #Recurso 01
  address_space_vnet = var.address_space_vnet
  location           = module.resource_group.location
  name               = module.resource_group.name
  prefix             = module.generador.prefix
  #Recurso 02
  address_prefixes   = var.address_prefixes
  #Recurso 03
  allocation_method_ip = var.allocation_method_ip
  #Recurso 05
  name_ip_net_int = var.name_ip_net_int
  private_ip_address_allocation_net_int = var.private_ip_address_allocation_net_int
}

#Modulo 03
module "virtualizacion" {
  source = "../modulos/03.-virtualizacion"

  #Recurso 01
  account_replication_type = var.account_replication_type
  account_tier = var.account_tier
  location = module.resource_group.location
  name = module.resource_group.name
  prefix = module.generador.prefix
  #Recurso 02
  adm_username             = var.adm_username
  network_interface        = [module.network.network_interface]
  password                 = module.generador.password
  size_vm                  = var.size_vm
  #Recurso 03
  publisher                = var.publisher
  type                     = var.type
  type_handler_version     = var.type_handler_version
}

#Modulo 04
module "generador" {
  source = "../modulos/04.-generador"

  byte_length = var.byte_length
  length_pass = var.length_pass
  min_lower   = var.min_lower
  min_upper   = var.min_upper
  min_numeric = var.min_numeric
  min_special = var.min_special
  prefix      = var.prefix
  length      = var.length
  special     = var.special
  name        = module.resource_group.name
}