variable "name" {
}

variable "resource_group_location" {
  type = string
}

variable "account_tier" {
  type = list(string)
}

variable "account_replication_type" {
  type = list(string)
}