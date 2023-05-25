variable "name_rg" {}
variable "location" {}
variable "address_space" {
    type = list(string)
}
variable "address_prefixes" {
    type = list(string)
}