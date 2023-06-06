#Crea una Azure Virtual Network para ubicar la subred que contendrá la máquina virtual.
#Recurso 1
resource "azurerm_virtual_network" "vnet" {
  name                               = "${var.name_rg}-vnet"
  address_space                      = [var.address_space]
  location                           = var.location
  resource_group_name                = var.name_rg
}

# Crea una subnet en la Azure Virtual Network anterior para ubicar la máquina virtual.
#Recurso 2
resource "azurerm_subnet" "subnet" {
  name                               = "${var.name}-web_subnet"
  resource_group_name                = var.name_rg
  virtual_network_name               = azurerm_virtual_network.vnet.name
  address_prefixes                   = [var.address_prefixes_web]
}

# Crea una dirección IP pública para el Load balancer que distribuye tráfico sobre las máquinas virtuales.
#Recurso 3
resource "azurerm_public_ip" "lb_public_ip" {
   name                              = "${var.name}-lb-public-ip"
   location                          = var.location
   resource_group_name               = var.name_rg
   allocation_method                 = "Static"
}


# Crea un Network Security Group para controlar el tráfico permitido a nivel de subred.
# Se configura para aceptar tráfico TCP entrante en los puertos 3389 (RDP) y 80 (HTTP).
#Recurso 4
resource "azurerm_network_security_group" "nsg" {
   name                              = "${var.name}-nsg"
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
   name                              = "${var.name}-avset"
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

#Recurso 7
resource "azurerm_subnet" "db_subnet" {
  name                              = "${var.name}-db_subnet"
  resource_group_name               = var.name_rg
  virtual_network_name              = azurerm_virtual_network.vnet.name
  address_prefixes                  = [var.address_prefixes_db]
}