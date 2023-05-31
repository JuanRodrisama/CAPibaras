#Recurso 1
resource "azurerm_managed_disk" "os_disk" {
  count                = length(var.vm_ids)
  name                 = "${var.name}-osdisk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.name_rg
  storage_account_type = var.storage_account_type
  create_option        = var.create_option_ondisk
  disk_size_gb         = var.os_disk_size_gb
}
#Recurso 2
resource "azurerm_managed_disk" "data_disk" {
  count                = length(var.vm_ids)
  name                 = "${var.name}-datadisk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.name_rg
  storage_account_type = var.storage_account_type
  create_option        = var.create_option_data
  disk_size_gb         = var.data_disk_size_gb
 }
#Recurso 3
resource "azurerm_virtual_machine_data_disk_attachment" "os_disk_attachment" {
  count                = length(var.vm_ids)
  managed_disk_id      = azurerm_managed_disk.os_disk[count.index].id
  virtual_machine_id   = var.vm_ids[count.index]
  lun                  = var.lun_disk
  caching              = var.caching
}
#Recurso 4
resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count                = length(var.vm_ids)
  managed_disk_id      = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id   = var.vm_ids[count.index]
  lun                  = var.lun_data
  caching              = var.caching
}