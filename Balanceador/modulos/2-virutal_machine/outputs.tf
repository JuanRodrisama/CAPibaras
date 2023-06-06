output "mv_client" {
  value = azurerm_linux_virtual_machine.client[*].id
}