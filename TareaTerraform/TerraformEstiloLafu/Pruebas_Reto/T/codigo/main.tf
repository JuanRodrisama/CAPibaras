module "modulos" {
  source = "../modulos"

resource_group_location       = var.resource_group_location

#2.- network.tf
  # Create virtual network
    address_space               = var.address_space
  # Create subnet
    address_prefixes            = var.address_prefixes 
  # Create public IPs
    allocation_method           = var.allocation_method  
  # Create Network Security Group and rules
    #security_rule1
      name_RDP                        = var.name_RDP
      priority_RDP                    = var.priority_RDP
      direction_RDP                   = var.direction_RDP
      access_RDP                      = var.access_RDP
      protocol_RDP                    = var.protocol_RDP
      source_port_range_RDP           = var.source_port_range_RDP
      destination_port_range_RDP      = var.destination_port_range_RDP
      source_address_prefix_RDP       = var.source_address_prefix_RDP
      destination_address_prefix_RDP  = var.destination_address_prefix_RDP

    #security_rule2
      name_WEB                        = var.name_WEB
      priority_WEB                    = var.priority_WEB
      direction_WEB                   = var.direction_WEB
      access_WEB                      = var.access_WEB
      protocol_WEB                    = var.protocol_WEB
      source_port_range_WEB           = var.source_port_range_WEB
      destination_port_range_WEB      = var.destination_port_range_WEB
      source_address_prefix_WEB       = var.source_address_prefix_WEB
      destination_address_prefix_WEB  = var.destination_address_prefix_WEB
  # Create network interface
    name_config                           = var.name_config
    private_ip_address_allocation_config  = var.private_ip_address_allocation_config

#3.- vm.tf
  # Create storage account for boot diagnostics
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  # Create virtual machine
  admin_username = var.admin_username
  size = var.size
      #os_disk
        name_os               = var.name_os
        caching               = var.caching
        storage_account_type  = var.storage_account_type
      #source_image_reference
        publisher_os            = var.publisher_os
        offer                 = var.offer
        sku                   = var.sku

  # Install IIS web server to the virtual machine
  publisher                     = var.publisher
  type                          = var.type
  type_handler_version          = var.type_handler_version
  auto_upgrade_minor_version    = var.auto_upgrade_minor_version


#4.- random_name.tf
prefix = var.prefix
}