output "subnet_id" {
    value = azurerm_subnet.subnet.id
}
output "name_rg" {
    value = azurerm_virtual_network.vnet.resource_group_name
}   
output "location" {
    value = azurerm_virtual_network.vnet.location
}