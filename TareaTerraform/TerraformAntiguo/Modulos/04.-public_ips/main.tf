# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  location            = var.resource_group_location  
  resource_group_name = "${var.name}-rg"
  allocation_method   = var.allocation_method
}