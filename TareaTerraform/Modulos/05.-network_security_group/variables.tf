variable "name_network_security" {
  type = list(string)
}

#SSH
variable "priority_ssh" {
  type = list(string)
}

variable "direction_ssh" {
  type = list(string)
}

variable "access_ssh" {
  type = list(string)
}
variable "protocol_ssh" {
  type = list(string)
}

variable "source_port_range_ssh" {
  type = list(string)
}

variable "destination_port_range_ssh" {
  type = list(string)
}

variable "source_address_prefix_ssh" {
  type = list(string)
}
variable "destination_address_prefix_ssh" {
  type = list(string)
}

#HTTP

variable "priority_http" {
  type = list(string)
}

variable "direction_http" {
  type = list(string)
}

variable "access_http" {
  type = list(string)
}
variable "protocol_http" {
  type = list(string)
}

variable "source_port_range_http" {
  type = list(string)
}

variable "destination_port_range_http" {
  type = list(string)
}

variable "source_address_prefix_http" {
  type = list(string)
}
variable "destination_address_prefix_http" {
  type = list(string)
}
