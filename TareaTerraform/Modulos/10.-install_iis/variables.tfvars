name                       = "${random_pet.prefix.id}-wsi"
virtual_machine_id         = azurerm_windows_virtual_machine.main.id
publisher                  = "Microsoft.Compute"
type                       = "CustomScriptExtension"
type_handler_version       = "1.8"
auto_upgrade_minor_version = true
