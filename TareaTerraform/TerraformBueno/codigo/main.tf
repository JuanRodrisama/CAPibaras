module "resource_group" {
  source = "../modulos/01.-resource_group"

  name        = "${var.name}-rg"
  location    = var.location
}


module "network" {
  source = "../modulos/02.-network"
#Recurso 01
  name_vnet                   = "${var.name_vnet}-1"
  address_space_vnet          = var.address_vnet
  location_vnet               = var.location
  resource_group_name_vnet    = "${var.name}-vnet"
#Recurso 02
  address_prefixes            = var.address_prefixes
  name_subnet                 = "${var.name_subnet}-1"
  resource_group_name_subnet  = "${var.name}-subnet"
  virtual_network_name        = var.virtual_network_name
#Recurso 03
  allocation_method_ip        = var.allocation_method_ip
  location_ip                 = var.location
  resource_group_name_ip      = "${var.name}-ip"
  name_ip                     = "${var.name_ip}-1"
#Recurso 04
  location_sg                 = var.location
  name_sg                     = "${var.name_sg}-1"
  resource_group_name_sg      = "${var.name}-sg"
#Recurso 05
  location_net_int            = var.location
  name_net_int                = "${var.name_net_int}-1"
  resource_group_name_net_int = "${var.name}-net_int"

  name_ip_net_int = var.name_ip_net_int
  subnet_id_net_int = var.subnet_id_net_int
  private_ip_address_allocation_net_int = var.private_ip_address_allocation_net_int
  public_ip_address_id_net_int = var.public_ip_address_id_net_int
#Recurso 06
  network_interface_id = var.network_interface_id
  network_security_group_id = var.network_security_group_id
}


module "storage_account" {
  source = "../modulos/03.-storage_account"

  account_replication_type        = var.account_replication_type
  account_tier                    = var.account_tier
  location_storage_acc            = var.location
  name_storage_acc                = var.name_storage_acc
  resource_group_name_storage_acc = "${var.name}-storage_account"
}


/*
module "virtual_machine" {
  source = "../modulos/04.-virtual_machine"

  adm_password             = var.adm_password
  adm_username             = var.adm_username
  location_vm              = var.location
  name_vm                  = "${var.name_vm}-1"
  network_interface_ids    = var.network_interface_ids
  resource_group_name_vm   = "${var.name}-vm"
  size_vm = var.size_vm
}*/

/*
module "vm_extension" {
  source = "../modulos/05.-install_iis"

  name_vm_extension = var.name_vm_extension
  publisher = var.publisher
  type = var.type
  type_handler_version = var.type_handler_version
  virtual_machine_id_extension = var.virtual_machine_id_extension
}*/

module "Unique" {
  source = "../modulos/06.-Unique_storage_account_name"

  resource_group_rid = "${var.name}-Unique"
  byte_length = var.byte_length
  length_pass = var.length_pass
  min_lower = var.min_lower
  min_upper = var.min_upper
  min_numeric = var.min_numeric
  min_special = var.min_special
  prefix = var.prefix
  length = var.length
  special = var.special
}