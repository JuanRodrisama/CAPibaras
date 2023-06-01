#Recurso 1
variable "name" {}
variable "name_rg" {}
variable "location" {}
variable "fault_domain_count" {}
variable "update_domain_count" {}
#Recurso 2
variable "vm_count_server" {}
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
variable "vm_count" {}
#Recurso 4
variable "count_vm_client" {}
variable "vm_size_client" {}
#source_image_reference
variable "publisher_client" {}
variable "offer_client" {}
variable "sku_client" {}
variable "version_vm_client" {}