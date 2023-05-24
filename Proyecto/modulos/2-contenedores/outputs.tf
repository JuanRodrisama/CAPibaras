# Salida de información
output "kube_config" {
  description = "Configuración de Kubernetes"
  value       = azurerm_kubernetes_cluster.container.kube_config_raw
}