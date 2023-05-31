output "vm_ids" {
  value = azurerm_linux_virtual_machine.my_vm[*].id
}