# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name                      = "diag${random_id.random_id.hex}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

# Create virtual machine

resource "azurerm_windows_virtual_machine" "main" {
    name                    = "${var.prefix}-vm"
    admin_username          = "azureuser"
    admin_password          = random_password.password.result
    location                = azurerm_resource_group.rg.location
    resource_group_name     = azurerm_resource_group.rg.name
    network_interface_ids   = [azurerm_network_interface.my_terraform_nic.id]
    size                    = "Standard_DS1_v2" 

    os_disk {
      name                  = var.name_os
      caching               = var.caching
      storage_account_type  = var.storage_account_type
    }

    source_image_reference {
      publisher             = var.publisher_os
      offer                 = var.offer
      sku                   = var.sku
      version               = "latest"
    }

    boot_diagnostics {
      storage_account_uri   = azurerm_storage_account.my_storage_account.primary_blob_endpoint
    }
}

# Install IIS web server to the virtual machine
resource "azurerm_virtual_machine_extension" "web_server_install" {
  name                          = "${random_pet.prefix.id}-wsi" 
  virtual_machine_id            = azurerm_windows_virtual_machine.main.id
  publisher                     = var.publisher
  type                          = var.type
  type_handler_version          = var.type_handler_version
  auto_upgrade_minor_version    = var.auto_upgrade_minor_version

settings = <<SETTINGS
    {
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
SETTINGS
}