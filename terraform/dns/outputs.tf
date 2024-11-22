
# Output the DNS A records for frontend and backend
output "frontend_dns" {
  description = "The DNS record for the frontend"
  value       = "http://${azurerm_dns_a_record.frontend.name}.${azurerm_dns_zone.raazresto_com.name}"
}

output "backend_dns" {
  description = "The DNS record for the backend"
  value       = "http://${azurerm_dns_a_record.backend.name}.${azurerm_dns_zone.raazresto_com.name}"
}

# Output the external IP of the Ingress Controller
output "ingress_ip" {
  description = "The external IP of the NGINX Ingress controller"
  value       = var.ingress_ip
}
