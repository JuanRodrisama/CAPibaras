module "resource_group" {
  source = "../Modulos/1.resource_group"
}

module "virtual_network" {
  source = "../Modulos/2.virtual_network"
}

module "subnet" {
  source = "./subnet"

  resource_group_name = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.virtual_network_name
  subnet_address_prefixes = ["10.0.1.0/24"]
}

module "public_ips" {
  source = "../Modulos/4.-public_ips"
}

module "network_security_group" {
  source = "../Modulos/5.-network_security_group"
}

module "network_interface" {
  source = "../Modulos/6.-network_interface"
}

module "security_group_to_network_interface" {
  source = "../Modulos/7.-security_group_to_network_interface"
}

module "storage_account_for_boot_diagnostics" ´{
  source = "../Modulos/8.-storage_account_for_boot_diagnostics"
} 

module "create_virtual_machine" {
  source = "../Modulos/9.-create_virtual_machine"
}

module "install_iis" {
  source = "../Modulos/10.-install_iis"
}

module "unique_storage_account_name" {
  source = "../Modulos/11.-unique_storage_account_name"
}
