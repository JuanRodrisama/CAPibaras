variable "name_vnet" {
  type = string
}

variable "address_space" {
  type = string
}

variable "location" {
  type = list(string)
}

variable "resource_group_name" {
  type = list(string)
}