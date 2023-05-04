
name_network_interface  = "${random_pet.prefix.id}-nic"
location            = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name

 
name_ip                       = "my_nic_configuration"
subnet_id                     = azurerm_subnet.my_terraform_subnet.id
private_ip_address_allocation = "Dynamic"
public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id

