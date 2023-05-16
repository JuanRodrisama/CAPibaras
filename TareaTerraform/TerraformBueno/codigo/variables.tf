//Modulo 01
variable "location" {
  default = "eastus"
  description = "Location of the resource group."
}
variable "name" {
  type = string
}

//Modulo 02 Recurso 01
variable "address_vnet" {
  type = list(string)
}
variable "name_vnet" {
  type = string
}

//Modulo 02 Recurso 02
variable "name_subnet" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}
variable "virtual_network_name" {
  type = string
}

//Modulo 02 Recurso 03
variable "allocation_method_ip" {
  type = string
}
variable "name_ip" {
  type = string
}

//Modulo 02 Recurso 04
variable "name_sg" {
  type = string
}

//Modulo 01 Recurso 01
variable "name_net_int" {
  type = string
}

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
}

variable "account_replication_type" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "name_storage_acc" {
  type = string
}


variable "adm_password" {
  type = string
}

variable "adm_username" {
  type = string
}

variable "name_vm" {
  type = string
}

variable "network_interface_ids" {
  type    = list(string)
  default = ["id-1", "id-2"]
}

variable "size_vm" {
  type = string
}


variable "name_vm_extension" {
  type = string
}

variable "publisher" {
  type = string
}

variable "type" {
  type = string
}

variable "type_handler_version" {
  type = string
}

variable "virtual_machine_id_extension" {
  type = string
  default = "id-1"
}


variable "byte_length" {
  type = string
}

variable "length_pass" {
  type = string
}

variable "min_lower" {
  type = string
}

variable "min_upper" {
  type = string
}

variable "min_numeric" {
  type = string
}

variable "min_special" {
  type = string
}

variable "special" {
  type = bool
}

variable "prefix" {
  type = string
}

variable "length" {
  type = string
}