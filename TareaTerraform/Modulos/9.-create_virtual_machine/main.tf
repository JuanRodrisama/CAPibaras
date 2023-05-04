# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  virtual_machine_name                  = "${var.prefix}-vm"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }


  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}