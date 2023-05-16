variable "resource_group_location" {
    description = "Location of the resource group."

}

#2.- network.tf
  # Create virtual network
  variable "address_space" {
      type       = string
  }
  # Create subnet
  variable "address_prefixes" {
    type = string
  }
  # Create public IPs
  variable "allocation_method" {
    type = string
  }
  # Create Network Security Group and rules
    #security_rule1
      variable "name_RDP" {
        type = string
      }
      variable "priority_RDP" {
        type = number
      }
      variable "direction_RDP" {
        type = string
      }
      variable "access_RDP" {
        type = string
      }
      variable "protocol_RDP" {
        type = string
      }
      variable "source_port_range_RDP" {
        type = string
      }
      variable "destination_port_range_RDP" {
        type = string
      }
      variable "source_address_prefix_RDP" {
        type = string
      }
      variable "destination_address_prefix_RDP" {
        type = string
      }

    #security_rule2
      variable "name_WEB" {
        type = string
      }
      variable "priority_WEB" {
        type = number
      }
      variable "direction_WEB" {
        type = string
      }
      variable "access_WEB" {
        type = string
      }
      variable "protocol_WEB" {
        type = string
      }
      variable "source_port_range_WEB" {
        type = string
      }
      variable "destination_port_range_WEB" {
        type = string
      }
      variable "source_address_prefix_WEB" {
        type = string
      }
      variable "destination_address_prefix_WEB" {
        type = string
      }
  # Create network interface
  variable "name_config" {
    type = string
  }
  variable "private_ip_address_allocation_config" {
    type = string
  }

#3.- vm.tf
  # Create storage account for boot diagnostics
    variable "account_tier" {
      type = string
    }
    variable "account_replication_type" {
      type = string
    }
  
  # Create virtual machine
    variable "admin_username" {
      type = string
    }
    variable "size" {
      type = string
    }
      #os_disk
        variable "name_os" {
          type = string
        }
        variable "caching" {
          type = string
        }
        variable "storage_account_type" {
          type = string
        }
      #source_image_reference
        variable "publisher_os" {
          type = string
        }
        variable "offer" {
          type = string
        }
        variable "sku" {
          type = string
        }
      # variable "version_si" {}

  # Install IIS web server to the virtual machine
    variable "publisher" {
      type = string
    }
    variable "type" {
      type = string      
    }
    variable "type_handler_version" {
      type = string
    }
    variable "auto_upgrade_minor_version" {
      type = bool
    }

#4.- random_name.tf
  variable "prefix" {
      type        = string
      description = "Prefix of the resource name"
  }