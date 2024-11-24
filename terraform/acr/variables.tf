
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-backend"
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "Central India"
}

variable "acr_name" {
  description = "Name for the Azure Container Registry"
  type        = string
  default     = "raisalacr"
}

variable "acr_admin_username" {
  description = "The admin username for ACR"
  type        = string
  default     = "user"
}

variable "aks_cluster_id" {
  description = "The resource ID of the existing AKS cluster"
  type        = string
  default     = "/subscriptions/8735ab23-01bd-4ecd-b27e-9cf23f97545c/resourceGroups/rg-backend/providers/Microsoft.ContainerService/managedClusters/aks-backend-cluster"
}

variable "acr_admin_password" {
  description = "The admin password for ACR"
  type        = string
  default     = "password"
}

variable "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Cluster"
  type        = string
  default     = "aks-backend-cluster"
}

variable "aks_principal_id" {
  description = "The principal ID of the AKS managed identity"
  type        = string
  default     = "252e1ee9-95a9-434e-9190-46d23eb0e62c"
}
