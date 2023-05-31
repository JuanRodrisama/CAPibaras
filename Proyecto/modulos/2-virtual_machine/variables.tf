#Recurso 1
variable "name" {}
variable "name_rg" {}
variable "location" {}
variable "fault_domain_count" {}
variable "update_domain_count" {}
#Recurso 2
variable "vm_count" {}
variable "size_vm" {}
variable "admin_username" {}
#on_disk
variable "caching" {}
variable "storage_account_type" {}
#source_image_reference
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "version_vm" {}
#Recurso 3
variable "subnet_id" {}
variable "private_ip_address_allocation" {}