resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.name_vm_extension
  publisher            = var.publisher
  type                 = var.type
  type_handler_version = var.type_handler_version
  virtual_machine_id   = var.virtual_machine_id_extension

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}