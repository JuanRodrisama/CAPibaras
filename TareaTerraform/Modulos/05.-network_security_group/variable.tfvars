name_network_security       = "${var.name}-nsg"
location                    = azurerm_resource_group.rg.location
resource_group_name         = azurerm_resource_group.rg.name


security_rule { 
    name_ssh                       = "RDP"
    priority_ssh                   = 1000
    direction_ssh                  = "Inbound"
    access_ssh                     = "Allow"
    protocol_ssh                   = "*"
    source_port_range_ssh          = "*"
    destination_port_range_ssh     = "3389"
    source_address_prefix_ssh      = "*"
    destination_address_prefix_ssh = "*"
}
security_rule {
    name_http                       = "web"
    priority_http                   = 1001
    direction_http                  = "Inbound"
    access_http                     = "Allow"
    protocol_http                   = "Tcp"
    source_port_range_http          = "*"
    destination_port_range_http     = "80"
    source_address_prefix_http      = "*"
    destination_address_prefix_http = "*"
}
    