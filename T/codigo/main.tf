module "resource_group" {
  source = "../modulos/01.-resource_group"

  name = "${var.name}-rg"
  location = var.location
}

module "network" {
  source = "../modulos/02.-network"

  name_vnet = "${var.name_vnet}-1"
  address_space_vnet = var.address_vnet
  location_vnet = var.location
  resource_group_name_vnet = "${var.name}-vnet"

  address_prefixes = var.address_prefixes
  name_subnet = "${var.name_subnet}-1"
  resource_group_name_subnet = "${var.name}-subnet"
  virtual_network_name = var.virtual_network_name

  allocation_method_ip = var.allocation_method_ip
  location_ip = var.location
  resource_group_name_ip = "${var.name}-ip"
  name_ip = "${var.name_ip}-1"

  location_sg = var.location
  name_sg = "${var.name_sg}-1"
  resource_group_name_sg = "${var.name}-sg"

  location_net_int = var.location
  name_net_int = "${var.name_net_int}-1"
  resource_group_name_net_int = "${var.name}-net_int"

  /*
  name_ip_net_int = var.name_ip_net_int
  subnet_id_net_int = var.subnet_id_net_int
  private_ip_address_allocation_net_int = var.private_ip_address_allocation_net_int
  public_ip_address_id_net_int = var.public_ip_address_id_net_int


  network_interface_id = var.network_interface_id
  network_security_group_id = var.network_security_group_id */
}
