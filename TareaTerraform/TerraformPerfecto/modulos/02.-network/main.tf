#Recurso 01
resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.prefix}-vn"
  address_space       = var.address_space_vnet
  location            = var.location
  resource_group_name = var.name
}

#Recurso 02
resource "azurerm_subnet" "subnet" {
  address_prefixes     = var.address_prefixes
  name                 = "${var.prefix}-subnet"
  resource_group_name  = var.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
}

#Recurso 03
resource "azurerm_public_ip" "public_ip" {
  allocation_method   = var.allocation_method_ip
  location            = var.location
  resource_group_name = var.name
  name                = "${var.prefix}-public-ip"
}

#Recurso 04
resource "azurerm_network_security_group" "security_group" {
  location            = var.location
  name                = "${var.prefix}-sg"
  resource_group_name = var.name
}

#Recurso 05
resource "azurerm_network_interface" "net_int" {
  location            = var.location
  name                = "${var.prefix}-network-interface"
  resource_group_name = var.name

  ip_configuration {
    name                          = var.name_ip_net_int
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation_net_int
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

#Recurso 06
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.net_int.id
  network_security_group_id = azurerm_network_security_group.security_group.id
}
