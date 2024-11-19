
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

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "aks_subnet_id" {
  description = "The ID of the AKS subnet"
  type        = string
  default     = "/subscriptions/8735ab23-01bd-4ecd-b27e-9cf23f97545c/resourceGroups/rg-backend/providers/Microsoft.Network/virtualNetworks/vnet-backend/subnets/aks-subnet"
}

variable "postgres_host" {
  description = "The hostname of the PostgreSQL server"
  type        = string
  default     = "pg-backend-server.postgres.database.azure.com"
}

variable "postgres_user" {
  description = "The PostgreSQL admin username"
  type        = string
  default     = "adminuser"
}

variable "postgres_password" {
  description = "The PostgreSQL admin password"
  type        = string
  sensitive   = true
  default     = "ComplexPassword123!"
}
