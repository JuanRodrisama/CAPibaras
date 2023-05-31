#Modulo 1
module "network" {
  source                        = "../modulos/1-network"

#Recurso 1
  name                          = var.name
  name_rg                       = var.name_rg
  location                      = var.location
  vnet_address                  = var.vnet_address
#Recurso 2
  address_prefixes_web          = var.address_prefixes_web
#Recurso 3
  address_prefixes_db           = var.address_prefixes_db
}

#Modulo 2
module "vm_availability_set" {
  source                        = "../modulos/2-virtual_machine"

#Recurso 1
  name_rg                       = var.name_rg
  name                          = var.name
  location                      = var.location
  fault_domain_count            = var.fault_domain_count
  update_domain_count           = var.update_domain_count
#Recurso 2
  vm_count                      = var.vm_count
  size_vm                       = var.size_vm
  admin_username                = var.admin_username
#on_disk
  caching                       = var.caching
  storage_account_type          = var.storage_account_type
#source_image_reference
  publisher                     = var.publisher
  offer                         = var.offer
  sku                           = var.sku
  version_vm                    = var.version_vm
#Recurso 3
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                     = module.network.subnet_web_id
}

#Modulo 3
module "storage" {
  source                        = "../modulos/3-storage"

#Recurso 1
  vm_ids                        = module.vm_availability_set.vm_ids
  name                          = var.name
  name_rg                       = var.name_rg
  location                      = var.location
  storage_account_type          = var.storage_account_type
  create_option_ondisk          = var.create_option_ondisk
  os_disk_size_gb               = var.os_disk_size_gb
#Recurso 2
  create_option_data            = var.create_option_data
  data_disk_size_gb             = var.data_disk_size_gb
#Recurso 3
  lun_disk                      = var.lun_disk
  caching                       = var.caching
#Recurso 4
  lun_data                      = var.lun_data
}

#Modulo 4
module "database" {
  source                        = "../modulos/4-database"

#Recurso 1
  name_server                   = var.name_server
  name_rg                       = var.name_rg
  location                      = var.location
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  version_sql                   = var.version_sql
#Recurso 2
  name_db                       = var.name_db
}









