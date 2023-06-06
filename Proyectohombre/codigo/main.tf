module "network" {
  source = "../modulos/1-network"
  
# Recurso 1
address_space    = var.address_space
location         = var.location
name_rg          = var.name_rg

# Recurso 2 
address_prefixes = var.address_prefixes
}

module "vm" {
  source = "../modulos/2-vm"

# Recurso 1
location         = var.location
name_rg          = var.name_rg
#avset_id         = module.network.avset_id

lb_public_ip     = module.network.ip_public_lb
subnet_id = module.network.subnet
ip_public_lb = module.network.ip_public_lb
ip_public = module.network.ip_public
}