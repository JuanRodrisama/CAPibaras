#Modulo 01
name = "CAPibaras"
location = "eastus"

#Modulo 2 Recurso 01
address_vnet = ["10.0.0.1/16"]
name_vnet = "vnet"
#Modulo 2 Recurso 02
name_subnet = "subnet"
address_prefixes = ["10.0.0.0/24", "192.168.1.0/24"]
virtual_network_name = "my-virtual-network"
#Modulo 2 Recurso 03
allocation_method_ip = "Dynamic"
name_ip = "IP"
#Modulo 2 Recurso 04
name_sg = "sg"
#Modulo 2 Recurso 05
name_net_int = "Network_Interface"
name_ip_net_int = "my_nic_configuration"
subnet_id_net_int = "subnetID"
private_ip_address_allocation_net_int = "Dynamic"
public_ip_address_id_net_int = "10.0.0.4/24"
#Modulo 2 Recurso 06
network_interface_id = "azurerm_network_interface.net_int.id"
network_security_group_id = "azurerm_network_security_group.security_group.id"

#Modulo 3
account_replication_type = "LRS"
account_tier = "Standard"
name_storage_acc = "storageacc"

#Modulo 04
adm_password = "CAPi-1234"
adm_username = "CAPibaraUser"
size_vm = "Standard_DS1_v2"
name_vm = "CAPibaras_VM"

#Modulo 05
name_vm_extension = "CAPi"
publisher = "Microsoft.Compute"
type = "CustomScriptExtension"
type_handler_version = "1.8"

#Modulo 06
byte_length = 8
length_pass = 20
min_lower = 1
min_upper = 1
min_numeric = 1
min_special = 1
special = true
prefix = "CAPIS"
length = 1