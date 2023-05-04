# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  
  locals {
    name              = "${random_pet.prefix.id}-public-ip"
}
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
}