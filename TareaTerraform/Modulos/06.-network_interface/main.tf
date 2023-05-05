# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                            = "${var.name}-nic"
  location                        = var.resource_group_location
  resource_group_name             = "${var.name}-rg"

  ip_configuration {
    name                          = var.name_ip
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}