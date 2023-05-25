#Módulo 1
#Recurso 1
variable "name_rg" {
  description      = "nombre del grupo de recursos"
  type = string
}
variable "location" {
  description      = "localizacion de los recursos"
  type             = string
  default          = "spaincentral"
}
variable "address_space" {
  description      = "Rango de IP"
  type             = list(string)
  default          = ["10.0.0.0/16"]
}
#Recurso 2
variable "address_prefixes" {
  description     = "Prefijo IP"
  type            = list(string)
  default         = ["10.0.1.0/24"]
}

#Módulo 3
variable "aks_dns_prefix" {
  description     = "Prefijo DNS del clúster de AKS"
  type            = string
  default         = "my-aks-cluster"
}
variable "aks_node_count" {
  description     = "numero de nodos"
  type            = string
  default         = "1"
}
variable "aks_vm_size" {
  description     = "tamaño del nodo"
  type            = string
  default         = "Standard_B2s" # 1 núcleo 1 gb ram
}
variable "type_identity" {
  description     = "Asigna una identidad al recurso"
  type            = string
  default         = "SystemAssigned"
}