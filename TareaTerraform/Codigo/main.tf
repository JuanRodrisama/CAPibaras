module "resource_group" {
  source = "../Modulos/1.-resource_group"

  name                    = "${var.name}-rg"
  resource_group_location = var.resource_group_location
}

module "virtual_network" {
  source = "../Modulos/2.-virtual_network"

  name_vnet           = "${var.name}-vnet"
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = "${var.name}-rg"
}

module "subnet" {
  source = "../Modulos/3.-Subnet"

  name_subnet           = "${var.name}-subnet"
  resource_group_name   = "${var.name}-rg"
  virtual_network_name  = "azurerm_virtual_network-${var.name}"
  address_prefixes      = var.subnet_address_prefixes
}

module "public_ips" {
  source = "../Modulos/4.-public_ips"
  location            = var.resource_group_location  
  resource_group_name = "${var.name}-rg"
  allocation_method   = var.allocation_method
}

module "network_security_group" {
  source = "../Modulos/5.-network_security_group"

  name_network_security             = "${var.name}-nsg"
  location                          = var.resource_group_location
  resource_group_name               = "${var.name}-rg"

  security_rule {
    name_ssh                       = var.name_ssh
    priority_ssh                   = var.priority_ssh
    direction_ssh                  = var.direction_ssh
    access_ssh                     = var.access_ssh
    protocol_ssh                   = var.protocol_ssh
    source_port_range_ssh          = var.source_port_range_ssh
    destination_port_range_ssh     = var.destination_port_range_ssh
    source_address_prefix_ssh      = var.source_address_prefix_ssh
    destination_address_prefix_ssh = var.destination_address_prefix_ssh
  }
  security_rule {
    name_http                       = var.name_http
    priority_http                   = var.priority_http
    direction_http                  = var.direction_http
    access_http                     = var.access_http
    protocol_http                   = var.protocol_http
    source_port_range_http          = var.source_port_range_http
    destination_port_range_http     = var.destination_port_range_http 
    source_address_prefix_http      = var.source_address_prefix_http 
    destination_address_prefix_http = var.destination_address_prefix_http
  }
}

module "network_interface" {
  source = "../Modulos/6.-network_interface"

  name                            = "${var.name}-nic"
  location                        = var.resource_group_location
  resource_group_name             = "${var.name}-rg"

  ip_configuration {
    name                          = var.name_ip
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
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
