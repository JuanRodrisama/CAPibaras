# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = var.name_network_interface
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.name_ip
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}