//Recurso 01
variable "account_tier" {}
variable "account_replication_type" {}

//Recurso 02
variable "adm_username" {}
variable "size_vm" {}

//Recurso 03
variable "publisher" {}
variable "type" {}
variable "type_handler_version" {}

#inputs
variable "location" {}
variable "name" {}
variable "prefix" {}
variable "password" {}
variable "network_interface" {
  type = list(string)
}