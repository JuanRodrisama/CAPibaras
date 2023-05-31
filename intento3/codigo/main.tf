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
#Recurso 4
  vm_count                      = var.vm_count
  private_ip_address_allocation = var.private_ip_address_allocation
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
  vm_count_server               = var.vm_count_server
  size_vm_server                = var.size_vm_server
  admin_username                = var.admin_username
  network_interface_ids_server  = module.network.interface_id[count.index]
#on_disk
  caching                       = var.caching
  storage_account_type          = var.storage_account_type
#source_image_reference
  publisher                     = var.publisher
  offer                         = var.offer
  sku                           = var.sku
  version_vm                    = var.version_vm
#Recurso 3
count_vm_client                 = var.count_vm_client
vm_size_client                  = var.vm_size_client
network_interface_ids_client    = module.network.interface_id[count.index + 3]
#storage_os_disk
os_disk_id                      = module.storage.os_disk_ids[count.index]
#source_image_reference
publisher_client                = var.publisher_client
offer_client                    = var.offer_client
sku_client                      = var.sku_client 
version_vm_client               = var.version_vm_client
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









