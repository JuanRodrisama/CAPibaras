#Recurso 1
variable "vm_ids" {}
variable "name" {}
variable "name_rg" {}
variable "location" {}
variable "storage_account_type" {}
variable "create_option_ondisk" {}
variable "os_disk_size_gb" {}
#Recurso 2
variable "create_option_data" {}
variable "data_disk_size_gb" {}
#Recurso 3
variable "lun_disk" {}
variable "caching" {}
#Recurso 4
variable "lun_data" {}