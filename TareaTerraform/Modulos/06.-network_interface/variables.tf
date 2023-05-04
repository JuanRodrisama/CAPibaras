variable "name_network_interface"  {

     type = string
}

variable "location" {
   type = list(string)
}
variable "resource_group_name" {
  type = list(string)
}
variable "name_ip" {
type= string  
}
variable "subnet_id" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}
variable "public_ip_address_id" {
  type = string
}