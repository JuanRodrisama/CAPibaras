output "avset" {
  value = azurerm_availability_set.avset.id
}
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "lb_public_ip" {
  value = azurerm_public_ip.lb_public_ip.id
}