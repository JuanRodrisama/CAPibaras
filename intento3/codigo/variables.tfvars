#Modulo 1
#Recurso 1
name_rg                                    = "rg_FCT_Capgemini_2023_Capibaras"
location                                   = "westeurope"
name                                       = "CAPibaras"
vnet_address                               = "10.0.0.0/16"
#Recurso 2
address_prefixes_web                       = "10.0.1.0/24"
#Recurso 3
address_prefixes_db                        = "10.0.2.0/24" 
#Recurso 4
private_ip_address_allocation              = "Dynamic"
vm_count                                   = 3
#Modulo 2
#Recurso 1
fault_domain_count                         = 2
update_domain_count                        = 5
#Recurso 2
vm_count_server                            = 2
size_vm_server                             = "standard_b1ms"
admin_username                             = "adminuser"
#on_disk
caching                                    = "ReadWrite"
storage_account_type                       = "Standard_LRS"
#source_image_reference
publisher                                  = "Canonical"
offer                                      = "UbuntuServer"
sku                                        = "18.04-LTS"
version_vm                                 = "latest"
#Recurso 3
count_vm_client                            = 3
vm_size_client                             = "standard_b1ms"
#storage_on_disk
create_option_attach                       = "Attach"
#os_profile  
usernamevm                                 = "capi"
passvm                                     = "Pass1234"

#Modulo 3
#Recurso 1
create_option_ondisk                       = "Empty"
os_disk_size_gb                            = 128
#Recurso 2
create_option_data                         = "Empty"
data_disk_size_gb                          = 512
#Recurso 3
lun_disk                                   = 0
#Recurso 4
lun_data                                   = 1

#Modulo 4
#Recurso 1
name_server                                = "myservercapiaras"
version_sql                                = "12.0"
administrator_login                        = "adminuser"
administrator_login_password               = "P@ssw0rd1234"
#Recurso 2
name_db                                    = "mydbcapibaras"