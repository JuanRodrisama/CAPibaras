# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = var_network_interface.id
  network_security_group_id = var_network_security_group.id
}