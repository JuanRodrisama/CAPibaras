#Recurso 1
resource "azurerm_virtual_network" "my_vnet" {
  name                = "${var.name}-vnet"
  address_space       = [var.vnet_address]
  location            = var.location
  resource_group_name = var.name_rg
}
#Recurso 2
resource "azurerm_subnet" "web_subnet" {
  name                 = "${var.name}-web_subnet"
  resource_group_name  = var.name_rg
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = [var.address_prefixes_web]
}
#Recurso 3
resource "azurerm_subnet" "db_subnet" {
  name                 = "${var.name}-db_subnet"
  resource_group_name  = var.name_rg
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = [var.address_prefixes_db]
}
#Recurso 4
resource "azurerm_network_interface" "my_nic" {
  count                                  = var.vm_count
  name                                   = "${var.name}-nic${count.index + 1}"
  location                               = var.location
  resource_group_name                    = var.name_rg

  ip_configuration {
    name                                 = "${var.name}-ipconfig"
    subnet_id                            = azurerm_subnet.web_subnet.id
    private_ip_address_allocation        = var.private_ip_address_allocation
  }
}