
output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
