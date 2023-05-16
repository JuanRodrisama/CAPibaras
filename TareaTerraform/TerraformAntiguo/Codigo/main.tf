module "resource_group" {
  source = "../Modulos/01.-resource_group"

  name                    = "${var.name}-rg"
  resource_group_location = var.resource_group_location
}

module "virtual_network" {
  source = "../Modulos/02.-virtual_network"

  name_vnet           = "${var.name}-vnet"
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = "${var.name}-rg"
}

module "subnet" {
  source = "../Modulos/03.-Subnet"

  name_subnet           = "${var.name}-subnet"
  resource_group_name   = "${var.name}-rg"
  virtual_network_name  = "azurerm_virtual_network-${var.name}"
  address_prefixes      = var.subnet_address_prefixes
}

module "public_ips" {
  source = "../Modulos/04.-public_ips"
  location            = var.resource_group_location  
  resource_group_name = "${var.name}-rg"
  allocation_method   = var.allocation_method
}

module "network_security_group" {
  source = "../Modulos/05.-network_security_group"

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

module "network_interface" {
  source = "../Modulos/06.-network_interface"

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

module "security_group_to_network_interface" {
  source = "../Modulos/07.-security_group_to_network_interface"

  network_interface_id      = var.network_interface.id
  network_security_group_id = var.network_security_group.id
}

module "storage_account_for_boot_diagnostics" {
  source = "../Modulos/08.-storage_account_for_boot_diagnostics"

  name_storage_account     = "diag${var.name}"
  location                 = var.resource_group_location
  resource_group_name      = "${var.name}-rg"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
} 

module "create_virtual_machine" {
  source = "../Modulos/09.-create_virtual_machine"

  virtual_machine_name              = "${var.prefix}-vm"
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  location                          = var.resource_group_location
  resource_group_name               = "${var.name}-rg"
  network_interface_ids             = var.network_interface_ids
  size                              = "Standard_DS1_v2"

  os_disk {
    name                            = "myOsDisk"
    caching                         = "ReadWrite"
    storage_account_type            = "Premium_LRS"
  }

  source_image_reference {
    publisher                       = "MicrosoftWindowsServer"
    offer                           = "WindowsServer"
    sku                             = "2022-datacenter-azure-edition"
    version                         = "latest"
  }


  boot_diagnostics {
    storage_account_uri             = var.storage_account_uri
  }
}

module "install_iis" {
  source = "../Modulos/10.-install_iis"

  name_install_iss           = "${var.name}-wsi"
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = var.publisher
  type                       = var.type
  type_handler_version       = var.type_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_minor_version

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}

module "unique_storage_account_name" {
  source = "../Modulos/11.-unique_storage_account_name"

  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${var.name}-rg"
  }

  byte_length = var.byte_length

  resource "random_password" "password" {
  length      = var.length
  min_lower   = var.min_lower
  min_upper   = var.min_upper
  min_numeric = var.min_numeric 
  min_special = var.min_special
  special     = var.special
  }

  resource "random_pet" "prefix" {
  prefix = var.prefix
  length = var.length
  }
}
