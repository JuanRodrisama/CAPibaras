#Modulo 01
variable "location" {}

#Modulo 02 Recurso 01
variable "address_space_vnet" {
  type = list(string)
}
#Modulo 02 Recurso 02
variable "address_prefixes" {
  type = list(string)
}
#Modulo 02 Recurso 03
variable "allocation_method_ip" {}
#Modulo 02 Recurso 05
variable "name_ip_net_int" {}
variable "private_ip_address_allocation_net_int" {}

#Modulo 03 Recurso 01
variable "account_replication_type" {}
variable "account_tier" {}
#Modulo 03 Recurso 02
variable "adm_username" {}
variable "size_vm" {}
#Modulo 03 Recurso 03
variable "type" {}
variable "type_handler_version" {}
variable "publisher" {}

#Modulo 04 Recurso 01
variable "byte_length" {}
#Modulo 04 Recurso 02
variable "length_pass" {}
variable "min_lower" {}
variable "min_upper" {}
variable "min_numeric" {}
variable "min_special" {}
variable "special" {
  type = bool
}
#Modulo 04 Recurso 03
variable "prefix" {}
variable "length" {}