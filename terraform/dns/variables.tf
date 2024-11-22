
# Define the name of the DNS Zone
variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
  default     = "raazresto.com"
}

# Define the Azure resource group where the DNS Zone exists
variable "resource_group_name" {
  description = "The resource group name where the DNS zone is located"
  type        = string
  default     = "rg-backend"
}

# Define the external IP of the NGINX Ingress controller
variable "ingress_ip" {
  description = "The external IP address of the NGINX Ingress controller"
  type        = string
  default     = "4.186.39.218"
}
