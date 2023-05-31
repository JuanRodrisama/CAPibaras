#Recurso 1
resource "azurerm_availability_set" "my_avset" {
  name                                   = "${var.name}-vnet"
  location                               = var.location
  resource_group_name                    = var.name_rg

  platform_fault_domain_count            = var.fault_domain_count
  platform_update_domain_count           = var.update_domain_count
}

#Recurso 2
resource "azurerm_linux_virtual_machine" "server" {
  count                                  = var.vm_count_server
  name                                   = "${var.name}-vm${count.index + 1}"
  resource_group_name                    = var.name_rg
  location                               = var.location
  size                                   = var.size_vm
  availability_set_id                    = azurerm_availability_set.my_avset.id
  admin_username                         = var.admin_username
  network_interface_ids                  = var.network_interface_ids_server
  
  disable_password_authentication        = false
  admin_password                         = "Cap123"

  os_disk {
    name                                 = "${var.name}-${count.index + 1}-vmdisk"
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
resource "azurerm_virtual_machine" "client" {
  count                                  = var.count_vm_client
  name                                   = "vm-${count.index}"
  resource_group_name                    = var.name_rg
  location                               = var.location
  size                                   = var.vm_size_client
  network_interface_ids                  = var.network_interface_ids_client
  storage_os_disk {
    name                                 = var.vm_os_disk
    caching                              = var.caching
    create_option                        = var.create_option_attach
    managed_disk_id                      = var.managed_disk_id_client

  os_profile{
    computer_name                        = "vm-${count.index}"
    admin_username                       = var.usernamevm
    admin_password                       = var.passvm
  }
  os_profile_linux_config{
    disable_password_authenticator       = false
  }
  }
}