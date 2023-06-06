#Modulo 1
module "network" {
  source             = "../modulos/1-network"

#Recurso 1
name                 = var.name
location             = var.location
name_rg              = var.name_rg
address_space        = var.address_space

#Recurso 2
address_prefixes_web = var.address_prefixes_web

#Recurso 7
address_prefixes_db  = var.address_prefixes_db
}

#Modulo 2
module "vm" {
  source             = "../modulos/2-virutal_machine"

#Recurso 1
name                 = var.name
location             = var.location
name_rg              = var.name_rg
avset_id             = module.network.avset

#Recurso 4
subnet_id            = module.network.subnet_id 

#Recurso 5
lb_public_ip         = module.network.lb_public_ip
}

#Modulo 3
module "storage" {
  source             = "../modulos/3-storage"

name                 = var.name
location             = var.location
name_rg              = var.name_rg
vm_id                = module.vm.mv_client
}

#Modulo 4
module "database" {
  source             = "../modulos/4-database"

location             = var.location
name_rg              = var.name_rg
}