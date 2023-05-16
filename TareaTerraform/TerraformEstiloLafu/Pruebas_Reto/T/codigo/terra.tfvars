resource_group_location = "eastus"

# 2.- netwrok.tf
# Create virtual network
    address_space           = "10.0.0.0/16"
# Create subnet
    address_prefixes        = "10.0.1.0/24"
# Create public IPs
    allocation_method       = "Dynamic"
# Create Network Security Group and rules
    #security_rule1
        name_RDP                       = "RDP"
        priority_RDP                   = 1000
        direction_RDP                  = "Inbound"
        access_RDP                     = "Allow"
        protocol_RDP                   = "*"
        source_port_range_RDP          = "*"
        destination_port_range_RDP     = "3389"
        source_address_prefix_RDP      = "*"
        destination_address_prefix_RDP = "*"


    #security_rule2
        name_WEB                       = "web"
        priority_WEB                   = 1000
        direction_WEB                  = "Inbound"
        access_WEB                     = "Allow"
        protocol_WEB                   = "Tcp"
        source_port_range_WEB          = "*"
        destination_port_range_WEB     = "80"
        source_address_prefix_WEB      = "*"
        destination_address_prefix_WEB = "*"
# Create network interface
    name_config                          = "my_nic_configuration"
    private_ip_address_allocation_config = "Dynamic"

#3.- vm.tf
    # Create storage account for boot diagnostics
        account_tier                          = "Standard"
        account_replication_type              = "LRS"

    # Create virtual machine
        admin_username                        = "azureuser"
        size                                  = "Standard_DS1_v2"
            #os_disk
            name_os                           = "myOsDisk"
            caching                           = "ReadWrite"
            storage_account_type              = "Premium_LRS"
            #source_image_reference
            publisher_os                      = "MicrosoftWindowsServer"
            offer                             = "WindowsServer"
            sku                               = "2022-datacenter-azure-edition"
            #version_si                       = "latest"
            
    # Install IIS web server to the virtual machine
        publisher                             = "Microsoft.Compute"
        type                                  = "CustomScriptExtension"
        type_handler_version                  = "1.8"
        auto_upgrade_minor_version            = true


#4.- random_name.tf
    prefix                  = "win-vm-iss"
