#Recurso 01
variable "byte_length" {}

#Recurso 02
variable "length_pass" {}
variable "min_lower" {}
variable "min_upper" {}
variable "min_numeric" {}
variable "min_special" {}
variable "special" {
  type = bool
}

#Recurso 03
variable "prefix" {}
variable "length" {}

#input
variable "name" {}