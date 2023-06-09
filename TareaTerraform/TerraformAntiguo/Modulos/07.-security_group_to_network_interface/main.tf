# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = var.network_interface.id
  network_security_group_id = var.network_security_group.id
}
