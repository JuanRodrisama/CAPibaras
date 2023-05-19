#Recurso 01
resource "azurerm_storage_account" "storage_account" {
  account_replication_type          = var.account_replication_type
  account_tier                      = var.account_tier
  location                          = var.location
  name                              = "${var.prefix}-storage-account"
  resource_group_name               = var.name
}

resource "azurerm_windows_virtual_machine" "VM1" {
  admin_password                    = var.password
  admin_username                    = var.adm_username
  location                          = var.location
  name                              = "${var.prefix}-vm"
  network_interface_ids             = var.network_interface
  resource_group_name               = var.name
  size                              = var.size_vm

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

resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                              = "${var.prefix}-vm-extension"
  publisher                         = var.publisher
  type                              = var.type
  type_handler_version              = var.type_handler_version
  virtual_machine_id                = azurerm_windows_virtual_machine.VM1.id

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}