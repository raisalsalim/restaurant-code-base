
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

variable "admin_username" {
  description = "PostgreSQL admin username"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "PostgreSQL admin password"
  type        = string
  default     = "ComplexPassword123!"
}
