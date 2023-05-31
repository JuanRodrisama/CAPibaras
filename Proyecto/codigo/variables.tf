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
variable "vnet_address" {
    type           = string
}   
#Recurso 2
variable "address_prefixes_web" {
    type           = string
}
#Recurso 3
variable "address_prefixes_db" {
    type           = string
}

#Modulo 2
#Recurso 1
variable "fault_domain_count" {
    type           = string
}
variable "update_domain_count" {
    type           = string
}
#Recurso 2
variable "vm_count" {
    type           = string
}
variable "size_vm" {
    type           = string
}
variable "admin_username" {
    type           = string
}
#on_disk
variable "caching" {
    type           = string
}
variable "storage_account_type" {
    type           = string
}
#source_image_reference
variable "publisher" {
    type           = string
}
variable "offer" {
    type           = string
}
variable "sku" {
    type           = string
}
variable "version_vm" {
    type           = string
}
#Recurso 3
variable "private_ip_address_allocation" {
    type           = string
}

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
