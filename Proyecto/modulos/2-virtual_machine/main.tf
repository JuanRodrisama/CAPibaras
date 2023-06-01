#Recurso 1
resource "azurerm_availability_set" "my_avset" {
  name                                   = "${var.name}-vnet"
  location                               = var.location
  resource_group_name                    = var.name_rg

  platform_fault_domain_count            = var.fault_domain_count
  platform_update_domain_count           = var.update_domain_count
}

#Recurso 2
resource "azurerm_linux_virtual_machine" "my_vm" {
  count                                  = var.vm_count_server
  name                                   = "${var.name}-server${count.index + 1}"
  resource_group_name                    = var.name_rg
  location                               = var.location
  size                                   = var.size_vm
  availability_set_id                    = azurerm_availability_set.my_avset.id
  admin_username                         = var.admin_username
  network_interface_ids                  = [azurerm_network_interface.my_nic[count.index].id]
  
  disable_password_authentication        = false
  admin_password                         = "Cap123"

  os_disk {
    name                                 = "${var.name}-${count.index + 1}-serverdisk"
    caching                              = var.caching
    storage_account_type                 = var.storage_account_type
  }
  source_image_reference {
    publisher                            = var.publisher
    offer                                = var.offer
    sku                                  = var.sku
    version                              = var.version_vm
  }
}

#Recurso 3
resource "azurerm_network_interface" "my_nic" {
  count                                  = var.vm_count
  name                                   = "${var.name}-nic${count.index + 1}"
  location                               = var.location
  resource_group_name                    = var.name_rg

  ip_configuration {
    name                                 = "${var.name}-ipconfig"
    subnet_id                            = var.subnet_id
    private_ip_address_allocation        = var.private_ip_address_allocation
  }
}

#Recurso 4
resource "azurerm_linux_virtual_machine" "client" {
  count                                  = var.count_vm_client
  name                                   = "${var.name}-client${count.index + 1}"
  resource_group_name                    = var.name_rg
  location                               = var.location
  size                                   = var.vm_size_client
  availability_set_id                    = azurerm_availability_set.my_avset.id
  admin_username                         = var.admin_username
  network_interface_ids                  = [azurerm_network_interface.my_nic[count.index + 2].id]
  
  disable_password_authentication        = false
  admin_password                         = "Cap123"
 
  os_disk {
    name                                 = "${var.name}-${count.index + 1}-clientdisk"
    caching                              = var.caching
    storage_account_type                 = var.storage_account_type
  }
    
  source_image_reference {
    publisher                            = var.publisher_client
    offer                                = var.offer_client
    sku                                  = var.sku_client
    version                              = var.version_vm_client
  }
}