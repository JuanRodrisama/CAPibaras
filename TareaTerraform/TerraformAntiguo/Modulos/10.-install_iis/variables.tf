variable "virtual_machine_id" {
  type = string
}

variable "publisher" {
  type = string
}

variable "type" {
  type = list(string)
}
variable "type_handler_version" {
  type = list(string)
}

variable "auto_upgrade_minor_version" {
  type = list(string)
}