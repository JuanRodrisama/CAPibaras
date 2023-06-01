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