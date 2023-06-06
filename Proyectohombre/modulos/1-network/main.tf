#Crea una Azure Virtual Network para ubicar la subred que contendrá la máquina virtual.
#Recurso 1
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


# Crea una Ip pública para cada equipo.
# Recurso 3
resource "azurerm_public_ip" "ip_public_vm" {
  count                              = 5
  name                               = "ip_public-${count.index}"
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

# Crea tarjetas de red (NIC) a asociar a cada máquina virtual

# Crea un Network Security Group para controlar el tráfico permitido a nivel de subred.
# Se configura para aceptar tráfico TCP entrante en los puertos 3389 (RDP) y 80 (HTTP).
#Recurso 5
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

# Crea Availability Set para incluir las máquinas virtuales como cluster de alta disponibilidad
#Recurso 5
resource "azurerm_availability_set" "avset" {
   name                              = "avset"
   location                          = var.location
   resource_group_name               = var.name_rg
   platform_fault_domain_count       = 2
   platform_update_domain_count      = 2
   managed                           = true
}

# Se asocia la Network Security Group (NSG) y la subred creada anteriormente.
# Así, las reglas contenidas en la NSG para filtrar tráfico aplican a toda la subred.
#Recurso 6
resource "azurerm_subnet_network_security_group_association" "association" {
   subnet_id                        = azurerm_subnet.subnet.id
   network_security_group_id        = azurerm_network_security_group.nsg.id
}