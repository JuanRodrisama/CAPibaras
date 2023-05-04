module "resource_group" {
  source = "../Modulos/1.-resource_group"
}

module "virtual_network" {
  source = "../Modulos/2.-virtual_network"
}

module "subnet" {
  source = "../Modulos/3.-Subnet"
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

module "storage_account_for_boot_diagnostics" {
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
