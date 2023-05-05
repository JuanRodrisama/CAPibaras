# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name_network_security             = "${var.name}-nsg"
  location                          = var.resource_group_location
  resource_group_name               = "${var.name}-rg"

  security_rule {
    name_ssh                       = var.name_ssh
    priority_ssh                   = var.priority_ssh
    direction_ssh                  = var.direction_ssh
    access_ssh                     = var.access_ssh
    protocol_ssh                   = var.protocol_ssh
    source_port_range_ssh          = var.source_port_range_ssh
    destination_port_range_ssh     = var.destination_port_range_ssh
    source_address_prefix_ssh      = var.source_address_prefix_ssh
    destination_address_prefix_ssh = var.destination_address_prefix_ssh
  }
  security_rule {
    name_http                       = var.name_http
    priority_http                   = var.priority_http
    direction_http                  = var.direction_http
    access_http                     = var.access_http
    protocol_http                   = var.protocol_http
    source_port_range_http          = var.source_port_range_http
    destination_port_range_http     = var.destination_port_range_http 
    source_address_prefix_http      = var.source_address_prefix_http 
    destination_address_prefix_http = var.destination_address_prefix_http
  }
}