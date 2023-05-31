output "subnet_web_id" {
  value = azurerm_subnet.web_subnet.id
}
output "subnet_db_id" {
  value = azurerm_subnet.db_subnet.id
}