#Recurso 1
 resource "azurerm_managed_disk" "data_disk" {
  count                = 3
  name                 = "${var.name}-datadisk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.name_rg
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 512
 }

#Recurso 2
resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count                = length(var.vm_id)
  managed_disk_id      = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id   = var.vm_id[count.index]
  lun                  = 1
  caching              = "ReadWrite"
}