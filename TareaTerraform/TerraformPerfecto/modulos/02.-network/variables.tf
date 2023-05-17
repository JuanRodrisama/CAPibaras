#Recurso 01
variable "address_space_vnet" {
  type = list(string)
}

#Recurso 02
variable "address_prefixes" {
  type = list(string)
}

#Recurso 03
variable "allocation_method_ip" {}

#Recurso 05
variable "private_ip_address_allocation_net_int" {}
variable "name_ip_net_int" {}

#inputs
variable "location" {}
variable "name" {}
variable "prefix" {}