resource "azurerm_subnet" "my_terraform_subnet" {
  
  name_subnet           = "${var.name}-subnet"
  resource_group_name   = "${var.name}-rg"
  virtual_network_name  = "azurerm_virtual_network-${var.name}"
  address_prefixes      = var.subnet_address_prefixes
}