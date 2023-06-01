#Modulo 1
#Recurso 1
variable "name_rg" {
    description    = "nombre grupo de recurso"
    type           = string
    default        = "CAPibaras"
}
variable "location" {
    description    = "localizacion"
    type           = string
    default        = "westeurope"
}
variable "name" {
    type           = string
    default        = "CAPibaras"
}
variable "vnet_address" {}   
#Recurso 2
variable "address_prefixes_web" {}
#Recurso 3
variable "address_prefixes_db" {}

#Modulo 2
#Recurso 1
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

#Modulo 3
#Recurso 1
#variable "create_option_ondisk" {}
#variable "os_disk_size_gb" {}
#Recurso 2
variable "create_option_data" {}
variable "data_disk_size_gb" {}
variable "count_datadisk" {}
#Recurso 3
#variable "lun_disk" {}
#Recurso 4
variable "lun_data" {}

#Modulo 4
#Recurso 1
variable "name_server" {}
variable "administrator_login" {}
variable "administrator_login_password" {}
variable "version_sql" {}
#Recurso 2
variable "name_db" {}
