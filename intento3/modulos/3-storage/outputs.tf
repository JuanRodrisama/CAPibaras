output "os_disk_ids" {
  value = azurerm_managed_disk.os_disk[*].id
}
output "os_disk_names" {
  value = azurerm_managed_disk.os_disk[*].name
}
output "data_disk_ids" {
  value = azurerm_managed_disk.data_disk[*].id
}