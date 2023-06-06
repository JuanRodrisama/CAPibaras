# Crea el cluster de máquinas virtuales
#Recurso 1
resource "azurerm_windows_virtual_machine" "vms" {
   count                               = 2
   name                                = "server-${count.index}"
   resource_group_name                 = var.name_rg
   location                            = var.location
   availability_set_id                 = var.avset_id
   admin_username                      = "adminuser"
   admin_password                      = "Capiba1234"
   size                                = "standard_b1ms"
   network_interface_ids               = [element(azurerm_network_interface.nic.*.id, count.index)]

   os_disk {
      name                             = "${var.name}_${count.index}"
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

# Crea tarjetas de red (NIC) a asociar a cada máquina virtual
#Recurso 2
resource "azurerm_network_interface" "nic" {
   count                                = 5
   name                                 = "${var.name}-nic${count.index}"
   location                             = var.location
   resource_group_name                  = var.name_rg

   ip_configuration {
      name                              = "${var.name}-nic-conf"
      subnet_id                         = var.subnet_id
      private_ip_address_allocation     = "Dynamic"
   }
}

# Crea Load Balancer para distribuir tráfico sobre las máquinas virtuales
#Recurso 3
resource "azurerm_lb" "lb" {
   name                                = "${var.name}-lb"
   location                            = var.location
   resource_group_name                 = var.name_rg

# Configura el Frontend del Load balancer con su dirección IP pública
frontend_ip_configuration {
   name                                = "${var.name}-lb-frontend-conf"
   public_ip_address_id                = var.lb_public_ip
   }
}


# Crea backend de soporte al Load Balancer y que contendrá las máquinas virtuales
#Recurso 4
resource "azurerm_lb_backend_address_pool" "backend" {
   loadbalancer_id                     = azurerm_lb.lb.id
   name                                = "${var.name}-backend"
}

# Configura el backend para incluir las máquinas virtuales vía NICs
#Recurso 5
resource "azurerm_network_interface_backend_address_pool_association" "backend_association" {
   count                               = 2
   ip_configuration_name               = "${var.name}-nic-conf"
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
   frontend_ip_configuration_name      = "${var.name}-lb-frontend-conf"
   backend_address_pool_ids            = [azurerm_lb_backend_address_pool.backend.id]
   probe_id                            = azurerm_lb_probe.probe.id
   depends_on                          = [azurerm_lb_probe.probe]
}

# Check en el Load Balancer para comprobar disponiblidad y estado de salud de cada máquina virtual (health probe)
#Recurso 7
resource "azurerm_lb_probe" "probe" {
   loadbalancer_id                     = azurerm_lb.lb.id
   name                                = "HTTP"
   port                                = 80
}

# Reglas NAT (Network Address Translation) en el Load Balancer para permitir acceso RDP (puerto 3389) mediante uso externo de otros puertos (50001, 50002)
#Recurso 8
resource "azurerm_lb_nat_rule" "nat_rule" {
   count                               = 2
   resource_group_name                 = var.name_rg
   loadbalancer_id                     = azurerm_lb.lb.id
   name                                = "RDPAccess-${count.index}"
   protocol                            = "Tcp"
   frontend_port                       = 50001 + count.index
   backend_port                        = 3389
   frontend_ip_configuration_name      = "${var.name}-lb-frontend-conf"
}

# Configura asociación entre NICs (VMs) y reglas NAT
#Recurso 9
resource "azurerm_network_interface_nat_rule_association" "nat_rule_association" {
   count                               = 2
   ip_configuration_name               = "${var.name}-nic-conf"
   network_interface_id                = azurerm_network_interface.nic[count.index].id
   nat_rule_id                         = azurerm_lb_nat_rule.nat_rule[count.index].id
}

#Recurso 10
resource "azurerm_linux_virtual_machine" "client" {
   count                               = 3
   name                                = "${var.name}-${count.index}"
   resource_group_name                 = var.name_rg
   location                            = var.location
   admin_username                      = "adminuser"
   admin_password                      = "Capiba1234"
   size                                = "standard_b1ms"
   network_interface_ids               = [azurerm_network_interface.nic[count.index + 2].id]
   disable_password_authentication        = false
   os_disk {
      name                             = "${var.name}_${count.index}-clientdisk"
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

