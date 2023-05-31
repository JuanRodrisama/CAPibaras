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
#Recurso 4
variable "vm_count" {}  
variable "private_ip_address_allocation" {}
#Modulo 2
#Recurso 1
variable "fault_domain_count" {}
variable "update_domain_count" {}
#Recurso 2
variable "vm_count_server" {}
variable "size_vm_server" {}
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
variable "count_vm_client" {}
variable "vm_size_client" {}
#source_image_reference
variable "publisher_client" {}
variable "offer_client" {}
variable "sku_client" {}
variable "version_vm_client" {}

#Modulo 3
#Recurso 1
variable "create_option_ondisk" {
    type           = string
}
variable "os_disk_size_gb" {
    type           = string
}
#Recurso 2
variable "create_option_data" {
    type           = string
}
variable "data_disk_size_gb" {
    type           = string
}
#Recurso 3
variable "lun_disk" {
    type           = string
}
#Recurso 4
variable "lun_data" {
    type           = string
}

#Modulo 4
#Recurso 1
variable "name_server" {
    type           = string
}
variable "administrator_login" {
    type           = string
}
variable "administrator_login_password" {
    type           = string
}
variable "version_sql" {
    type           = string
    default        = "12.0"
}
#Recurso 2
variable "name_db" {
    type           = string
}
