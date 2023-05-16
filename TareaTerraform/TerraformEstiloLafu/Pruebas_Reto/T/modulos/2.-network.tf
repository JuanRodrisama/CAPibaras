# Create virtual network

resource "azurerm_virtual_network" "my_terraform_network" {
  name                      = "${random_pet.prefix.id}-vnet"
  address_space             = [var.address_space]
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
}

# Create subnet

resource "azurerm_subnet" "my_terraform_subnet" {
  name                       = "${random_pet.prefix.id}-subnet"
  resource_group_name        = azurerm_resource_group.rg.name
  virtual_network_name       = azurerm_virtual_network.my_terraform_network
  address_prefixes           = [var.address_prefixes] 
}

# Create public IPs

resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                       = "${random_pet.prefix.id}-nsg"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  allocation_method          = var.allocation_method
}
# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                        = "${random_pet.prefix.id}-nsg"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name

  security_rule {
    name                       = var.name_RDP
    priority                   = var.priority_RDP
    direction                  = var.direction_RDP
    access                     = var.access_RDP
    protocol                   = var.protocol_RDP
    source_port_range          = var.source_port_range_RDP
    destination_port_range     = var.destination_port_range_RDP
    source_address_prefix      = var.source_address_prefix_RDP
    destination_address_prefix = var.destination_address_prefix_RDP
  }

  security_rule {
    name                       = var.name_WEB
    priority                   = var.priority_WEB
    direction                  = var.direction_WEB
    access                     = var.access_WEB
    protocol                   = var.protocol_WEB
    source_port_range          = var.source_port_range_WEB
    destination_port_range     = var.destination_port_range_WEB
    source_address_prefix      = var.source_address_prefix_WEB
    destination_address_prefix = var.destination_address_prefix_WEB
  }
}
# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                          = "${random_pet.prefix.id}-nic"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name

    ip_configuration {
      name                          = var.name_config
      subnet_id                     = azurerm_subnet.my_terraform_subnet.id
      private_ip_address_allocation = var.private_ip_address_allocation_config
      public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id          = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id     = azurerm_network_security_group.my_terraform_nsg.id
}