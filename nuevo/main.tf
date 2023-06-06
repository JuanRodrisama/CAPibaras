resource "azurerm_public_ip" "ip_public_client" {
  count                              = 2
  name                               = "ip_public_client-${count.index}"
  location                           = var.location
  resource_group_name                = var.name_rg
  allocation_method                  = "Dynamic"
}

resource "azurerm_public_ip" "ip_public_server" {
  count                              = 2
  name                               = "ip_public_client-${count.index}"
  location                           = var.location
  resource_group_name                = var.name_rg
  allocation_method                  = "Dynamic"
}

resource "azurerm_public_ip" "ip_public_lb" {
  name                               = "ip_public-lb"
  location                           = var.location
  resource_group_name                = var.name_rg
  allocation_method                  = "Dynamic"
}

resource "azurerm_virtual_network" "vnet" {
  name                               = "vnet"
  address_space                      = [var.address_space]
  location                           = var.location
  resource_group_name                = var.name_rg
}

# Crea una subnet en la vnet para ubicar las máquinas cliente.
#Recurso 2
resource "azurerm_subnet" "subnet" {
  name                               = "subnet"
  resource_group_name                = var.name_rg
  virtual_network_name               = azurerm_virtual_network.vnet.name
  address_prefixes                   = [var.address_prefixes]
}

resource "azurerm_network_security_group" "nsg" {
   name                              = "nsg"
   location                          = var.location
   resource_group_name               = var.name_rg

   security_rule {
      name                           = "RDP"
      priority                       = 100
      direction                      = "Inbound"
      access                         = "Allow"
      protocol                       = "Tcp"
      source_port_range              = "*"
      destination_port_range         = "3389"
      source_address_prefix          = "*"
      destination_address_prefix     = "*"
   }

   security_rule {
      name                           = "TCP_80"
      priority                       = 200
      direction                      = "Inbound"
      access                         = "Allow"
      protocol                       = "Tcp"
      source_port_range              = "*"
      destination_port_range         = "80"
      source_address_prefix          = "*"
      destination_address_prefix     = "*"
   }
}

resource "azurerm_network_interface" "nic_client" {
  count                              = 2
  name                               = "nic_client-${count.index}"
  location                           = var.location
  resource_group_name                = var.name_rg
  ip_configuration {
    name                             = "ipconfig_client-${count.index}"
    subnet_id                        = azurerm_subnet.subnet.id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = azurerm_public_ip.ip_public_client[count.index].id
}
}

resource "azurerm_network_interface" "nic_server" {
  count                              = 2
  name                               = "nic_server-${count.index}"
  location                           = var.location
  resource_group_name                = var.name_rg
  ip_configuration {
    name                             = "ipconfig_server-${count.index}"
    subnet_id                        = azurerm_subnet.subnet.id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = azurerm_public_ip.ip_public_server[count.index].id
}
}

resource "azurerm_network_interface" "niclb" {
  count                              = 1
  name                               = "nic-lb"
  location                           = var.location
  resource_group_name                = var.name_rg
  ip_configuration {
    name                             = "ipconfig-lb"
    subnet_id                        = azurerm_subnet.subnet.id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = azurerm_public_ip.ip_public_lb.id
  }
}

resource "azurerm_windows_virtual_machine" "client" {
   count                               = 2
   name                                = "vmclient${count.index + 1}"
   resource_group_name                 = var.name_rg
   location                            = var.location
   admin_username                      = "adminuser"
   admin_password                      = "Capiba1234"
   size                                = "standard_b1ms"
   network_interface_ids               = [azurerm_network_interface.nic_client[count.index].id]
   
   os_disk {
      name                             = "disk_mvclient${count.index}"
      caching                          = "ReadWrite"
      storage_account_type             = "Standard_LRS"
   }

   source_image_reference {
      publisher                        = "windows-11"
      offer                            = "MicrosoftWindowsDesktop"
      sku                              = "win11-21h2-avd"
      version                          = "latest"
   }
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow-ssh"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.name_rg
  network_security_group_name = azurerm_network_security_group.nsg.name
}