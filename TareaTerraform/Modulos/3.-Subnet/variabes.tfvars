  name_subnet                 = var.name
  resource_group_name         = azurerm_resource_group.rg.name
  virtual_network_name        = azurerm_virtual_network.my_terraform_network.name
  subnet_address_prefixes     = ["10.0.1.0/24"]