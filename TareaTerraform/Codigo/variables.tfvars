#Variables comunes en todos los modulos

    name                                = "CAPibaras"
    resource_group_location             = "eastus"

#Modulo 1 - Check
    
#Modulo 2 - Check

    address_space                       = ["10.0.0.0/16"]

#Modulo 3 - Check

    subnet_address_prefixes             = ["10.0.1.0/24"]

#Modulo 4 - Check

    allocation_method                   = "Dynamic"

#Modulo 5 - Check

    security_rule { 
        name_ssh                        = "RDP"
        priority_ssh                    = 1000
        direction_ssh                   = "Inbound"
        access_ssh                      = "Allow"
        protocol_ssh                    = "*"
        source_port_range_ssh           = "*"
        destination_port_range_ssh      = "3389"
        source_address_prefix_ssh       = "*"
        destination_address_prefix_ssh  = "*"
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
    
#Modulo 6 - Check
    
    name_ip                             = "my_nic_configuration"
    subnet_id                           = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation       = "Dynamic"
    public_ip_address_id                = azurerm_public_ip.my_terraform_public_ip.id

#Modulo 7 - Check

    network_interface_id                = "azurem_network_interface.my_terraform_nic.id"
    network_security_group_id           = "azurem_network_security_group.my_terraform_ngs.id"

#Modulo 8 - Check

    account_tier                        = "Standard"
    account_replication_type            = "LRS"

#Modulo 9 - Check

    admin_username                      = "azureuser"
    admin_password                      = 1234
    network_interface_ids               = [azurerm_network_interface.my_terraform_nic.id]
    storage_account_uri                 = azurerm_storage_account.my_storage_account.primary_blob_endpoint

#Modulo 10

    virtual_machine_id                  = azurerm_windows_virtual_machine.main.id
    publisher                           = "Microsoft.Compute"
    type                                = "CustomScriptExtension"
    type_handler_version                = "1.8"
    auto_upgrade_minor_version          = true
#Modulo 11

  #resource "random_id" "random_id" 
    resource_group                      = azurerm_resource_group.rg.name
    byte_length                         = 8

  # resource "random_password" "password"
    length                              = 20
    min_lower                           = 1
    min_upper                           = 1
    min_numeric                         = 1
    min_special                         = 1
    special                             = "win-vm-iis"

  # resource "random_pet" "prefix" 
    prefix                              = var.prefix
    length                              = 1

