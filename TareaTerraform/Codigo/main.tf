module "resource_group" {
  source = "../Modulos/1.-resource_group"
}

module "virtual_network" {
  source = "../Modulos/2.-virtual_network"
}

module "subnet" {
  source = "../Modulos/3.-Subnet"
}

module "public_ips" {
  source = "../Modulos/4.-public_ips"
}

module "network_security_group" {
  source = "../Modulos/5.-network_security_group"
}

module "network_interface" {
  source = "../Modulos/6.-network_interface"
}

module "security_group_to_network_interface" {
  source = "../Modulos/7.-security_group_to_network_interface"

  network_interface_id      = var.network_interface.id
  network_security_group_id = var.network_security_group.id
}

module "storage_account_for_boot_diagnostics" {
  source = "../Modulos/8.-storage_account_for_boot_diagnostics"

  name_storage_account     = "diag${var.name}"
  location                 = var.resource_group_location
  resource_group_name      = "${var.name}-rg"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
} 

module "create_virtual_machine" {
  source = "../Modulos/9.-create_virtual_machine"

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

module "install_iis" {
  source = "../Modulos/10.-install_iis"

  
}

module "unique_storage_account_name" {
  source = "../Modulos/11.-unique_storage_account_name"
}
