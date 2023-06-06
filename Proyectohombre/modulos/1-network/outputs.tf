/*output "avset_id" {
  value = azurerm_availability_set.avset.id
}*/

output "ip_public" {
  value = azurerm_public_ip.ip_public_vm[*].id
}

output "ip_public_lb" {
  value = azurerm_public_ip.ip_public_lb.id
}

output "subnet" {
  value = azurerm_subnet.subnet.id
}