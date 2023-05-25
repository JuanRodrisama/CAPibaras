#Módulo 1
#Recurso 1
location                 = "westeurope"
name_rg                  = "rg_FCT_Capgemini_2023_Capibaras"
address_space            = ["192.168.0.0/24"]
#Recurso 2
address_prefixes         = ["192.168.0.0/24"]

#Módulo 2
aks_dns_prefix           = "my-aks-cluster"
aks_node_count           = "1"
aks_vm_size              = "Standard_DS2_v2" 
type_identity            = "SystemAssigned"