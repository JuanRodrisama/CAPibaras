#Módulo 1
address_space            = ["10.0.0.0/16"]
address_prefixes         = ["10.0.1.0/24"]
location = "spaincentral"
name_rg = "rg_FCT_Capgemini_2023_Capibaras"


#Módulo 2
aks_dns_prefix           = "my-aks-cluster"
aks_node_count           = "1"
aks_vm_size              = "Standard_A2" #2 nucleos 3.5gb
type_identity            = "SystemAssigned"