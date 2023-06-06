# Crea las máquinas virtuales de los servidores XAMPP
# Recurso 1
resource "azurerm_windows_virtual_machine" "server" {
   count                               = 2
   name                                = "server-${count.index + 1}"
   resource_group_name                 = var.name_rg
   location                            = var.location
   #availability_set_id                 = var.avset_id
   admin_username                      = "adminuser"
   admin_password                      = "Adminuser123"
   size                                = "standard_b1ms"
   network_interface_ids               = [element(azurerm_network_interface.nic.*.id, count.index)]

   os_disk {
      name                             = "os_disk_server${count.index + 1}"
      caching                          = "ReadWrite"
      storage_account_type             = "Standard_LRS"
   }

   source_image_reference {
      publisher                        = "MicrosoftWindowsServer"
      offer                            = "WindowsServer"
      sku                              = "2019-Datacenter"
      version                          = "latest"
   }
}

# Crea la máquina virtual para alojar el sistema de monitorización (Grafana)
# Recurso 2
resource "azurerm_windows_virtual_machine" "grafana" {
   count                               = 1
   name                                = "grafana"
   resource_group_name                 = var.name_rg
   location                            = var.location
   admin_username                      = "adminuser"
   admin_password                      = "Adminuser123"
   size                                = "standard_b1ms"
   network_interface_ids               = [element(azurerm_network_interface.nic.*.id, count.index)]

   os_disk {
      name                             = "os_disk_grafana"
      caching                          = "ReadWrite"
      storage_account_type             = "Standard_LRS"
   }

   source_image_reference {
      publisher                        = "MicrosoftWindowsServer"
      offer                            = "WindowsServer"
      sku                              = "2019-Datacenter"
      version                          = "latest"
   }
}

# Crea las máquinas cliente.
resource "azurerm_linux_virtual_machine" "client" {
   count                               = 2
   name                                = "mvclient-${count.index + 1}"
   resource_group_name                 = var.name_rg
   location                            = var.location
   admin_username                      = "adminuser"
   admin_password                      = "Capiba1234"
   size                                = "standard_b1ms"
   network_interface_ids               = [element(azurerm_network_interface.nic.*.id, count.index)]
   disable_password_authentication     = false
   os_disk {
      name                             = "os_disk_mvclient${count.index + 1}"
      caching                          = "ReadWrite"
      storage_account_type             = "Standard_LRS"
   }

   source_image_reference {
      publisher                        = "Debian"
      offer                            = "debian-11"
      sku                              = "11-backports-gen2"
      version                          = "latest"
   }
}

# Crea Load Balancer para distribuir tráfico sobre las máquinas virtuales
#Recurso 3
resource "azurerm_lb" "lb" {
   name                                = "loadbalancer"
   location                            = var.location
   resource_group_name                 = var.name_rg

# Configura el Frontend del Load balancer con su dirección IP pública
frontend_ip_configuration {
   name                                = "lb-frontend-conf"
   public_ip_address_id                = var.lb_public_ip
   }
}


# Crea backend de soporte al Load Balancer y que contendrá las máquinas virtuales
#Recurso 4
resource "azurerm_lb_backend_address_pool" "backend" {
   loadbalancer_id                     = azurerm_lb.lb.id
   name                                = "loadbalancer-backend"
}

# Configura el backend para incluir las máquinas virtuales vía NICs
#Recurso 5
resource "azurerm_network_interface_backend_address_pool_association" "backend_association" {
   count                               = 2
   ip_configuration_name               = "nic-conf"
   network_interface_id                = azurerm_network_interface.nic[count.index].id
   backend_address_pool_id             = azurerm_lb_backend_address_pool.backend.id
}

# Crea regla en el Load Balancer para dirigir tráfico HTTP al backend
#Recurso 6
resource "azurerm_lb_rule" "lb_http_rule" {
   loadbalancer_id                     = azurerm_lb.lb.id
   name                                = "HTTPRule"
   protocol                            = "Tcp"
   frontend_port                       = 80
   backend_port                        = 80
   frontend_ip_configuration_name      = "lb-frontend-conf"
   backend_address_pool_ids            = [azurerm_lb_backend_address_pool.backend.id]
}

resource "azurerm_network_interface" "nic" {
  count                              = 5
  name                               = "nic-${count.index}"
  location                           = var.location
  resource_group_name                = var.name_rg
  ip_configuration {
    name                             = "ipconfig-${count.index}"
    subnet_id                        = var.subnet_id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = var.ip_public[count.index]
}
}

resource "azurerm_network_interface" "niclb" {
  count                              = 1
  name                               = "nic-lb"
  location                           = var.location
  resource_group_name                = var.name_rg
  ip_configuration {
    name                             = "ipconfig-lb"
    subnet_id                        = var.subnet_id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = var.ip_public_lb
  }
}