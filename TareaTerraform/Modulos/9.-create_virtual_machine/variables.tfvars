admin_username        = "azureuser"
admin_password        = random_password.password.result
location              = azurerm_resource_group.rg.location
resource_group_name   = azurerm_resource_group.rg.name
network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint