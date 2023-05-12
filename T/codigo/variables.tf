variable "location" {
  default = "eastus"
  description = "Location of the resource group."
}

variable "name" {
  type = string
}

variable "address_vnet" {
  type = list(string)
}

variable "name_vnet" {
  type = string
}

variable "name_subnet" {
  type = string
}

variable "address_prefixes" {
  type = list(string)
}

variable "virtual_network_name" {
  type = string
}

variable "allocation_method_ip" {
  type = string
}

variable "name_ip" {
  type = string
}

variable "name_sg" {
  type = string
}

variable "name_net_int" {
  type = string
}
/*
variable "name_ip_net_int" {
  type = string
}

variable "private_ip_address_allocation_net_int" {
  type = string
}

variable "public_ip_address_id_net_int" {
  type = string
}

variable "subnet_id_net_int" {
  type = string
}

variable "network_interface_id" {
  type = string
}

variable "network_security_group_id" {
  type = string
}*/