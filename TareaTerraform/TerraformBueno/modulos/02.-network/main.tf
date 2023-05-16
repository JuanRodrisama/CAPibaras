resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name_vnet
  address_space       = var.address_space_vnet
  location            = var.location_vnet
  resource_group_name = var.resource_group_name_vnet
}

resource "azurerm_subnet" "subnet" {
  address_prefixes     = var.address_prefixes
  name                 = var.name_subnet
  resource_group_name  = var.resource_group_name_subnet
  virtual_network_name = var.virtual_network_name
}

resource "azurerm_public_ip" "public_ip" {
  allocation_method   = var.allocation_method_ip
  location            = var.location_ip
  resource_group_name = var.resource_group_name_ip
  name                = var.name_ip
}

resource "azurerm_network_security_group" "security_group" {
  location            = var.location_sg
  name                = var.name_sg
  resource_group_name = var.resource_group_name_sg
}

/*
resource "azurerm_network_interface" "net_int" {
  location            = var.location_net_int
  name                = var.name_net_int
  resource_group_name = var.resource_group_name_net_int

  ip_configuration {
    name                          = var.name_ip_net_int
    subnet_id                     = var.subnet_id_net_int
    private_ip_address_allocation = var.private_ip_address_allocation_net_int
    public_ip_address_id          = var.public_ip_address_id_net_int
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id
}*/
