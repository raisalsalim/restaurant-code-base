
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-backend-cluster"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-backend"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = var.aks_subnet_id
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "10.2.0.0/24"
    dns_service_ip    = "10.2.0.10"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "production"
  }
}

resource "kubernetes_secret" "db_credentials" {
  metadata {
    name = "db-credentials"
  }

  data = {
    postgres_host     = var.postgres_host
    postgres_user     = var.postgres_user
    postgres_password = var.postgres_password
  }

  type = "Opaque"
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  chart      = "./kubernetes/argo-cd" # Path to the ArgoCD chart

  set {
    name  = "server.service.type"
    value = "ClusterIP" # Use ClusterIP instead of LoadBalancer
  }
}
