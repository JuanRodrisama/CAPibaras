#Recurso 01
variable "name_vnet" {
  type = string
}
variable "address_space_vnet" {
  type = list(string)
}
variable "location_vnet" {
  type = string
}
 variable "resource_group_name_vnet" {
   type = string
 }

#Recurso 02
variable "address_prefixes" {
  type = list(string)
}
variable "name_subnet" {
  type = string
}
variable "resource_group_name_subnet" {
  type = string
}
variable "virtual_network_name" {
  type    = string
}

#Recurso 03
variable "resource_group_name_ip" {
  type = string
}
variable "location_ip" {
  type = string
}
variable "allocation_method_ip" {
  type = string
}
variable "name_ip" {
  type = string
}

#Recurso 04
variable "location_sg" {
  type = string
}
variable "name_sg" {
  type = string
}
variable "resource_group_name_sg" {
  type = string
}

#Recurso 05
variable "location_net_int" {
  type = string
}
variable "name_net_int" {
  type = string
}
variable "resource_group_name_net_int" {
  type = string
}
variable "subnet_id_net_int" {
  type = string
}
variable "private_ip_address_allocation_net_int" {
  type = string
}
variable "public_ip_address_id_net_int" {
  type    = string
}
variable "name_ip_net_int" {
  type = string
}

#Recurso 06
variable "network_interface_id" {
  type = string
}
variable "network_security_group_id" {
  type = string
}