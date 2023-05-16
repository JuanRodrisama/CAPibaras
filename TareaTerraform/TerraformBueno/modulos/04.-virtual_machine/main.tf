resource "azurerm_windows_virtual_machine" "VM1" {
  admin_password        = var.adm_password
  admin_username        = var.adm_username
  location              = var.location_vm
  name                  = var.name_vm
  network_interface_ids = var.network_interface_ids
  resource_group_name   = var.resource_group_name_vm
  size                  = var.size_vm

    os_disk {
    name                            = "myOsDisk"
    caching                         = "ReadWrite"
    storage_account_type            = "Premium_LRS"
  }

  source_image_reference {
    publisher                       = "MicrosoftWindowsServer"
    offer                           = "WindowsServer"
    sku                             = "2022-datacenter-azure-edition"
    version                         = "latest"
  }
}