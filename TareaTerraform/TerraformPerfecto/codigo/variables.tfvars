#Modulo 01
location = "spaincentral"

#Modulo 02 Recurso 01
address_space_vnet = ["10.0.0.1/16"]
#Modulo 02 Recurso 02
address_prefixes = ["10.0.0.0/24", "192.168.1.0/24"]
#Modulo 02 Recurso 03
allocation_method_ip = "Dynamic"
#Modulo 02 Recurso 05
name_ip_net_int = "my_nic_configuration"
private_ip_address_allocation_net_int = "Dynamic"

#Modulo 03 Recurso 01
account_replication_type = "LRS"
account_tier = "Standard"
#Modulo 03 Recurso 02
adm_username = "CAPibaraUser"
size_vm = "Standard_DS1_v2"
#Modulo 03 Recurso 03
publisher = "Microsoft.Compute"
type = "CustomScriptExtension"
type_handler_version = "1.8"

#Modulo 04
byte_length = 8
length_pass = 20
min_lower = 1
min_upper = 1
min_numeric = 1
min_special = 1
special = true
prefix = "CAPIS"
length = 1