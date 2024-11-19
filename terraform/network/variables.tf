
variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
  default     = "rg-backend"
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
  default     = "Central India"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
