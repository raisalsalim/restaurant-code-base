
# Define the DNS Zone (replace with your actual DNS zone name)
resource "azurerm_dns_zone" "raazresto_com" {
  name                = var.dns_zone_name  # Use variable for DNS zone name
  resource_group_name = var.resource_group_name  # Use variable for resource group
}

# Create A record for frontend
resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend"
  zone_name           = azurerm_dns_zone.raazresto_com.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ingress_ip]  # Use variable for Ingress external IP
}

# Create A record for backend
resource "azurerm_dns_a_record" "backend" {
  name                = "backend"
  zone_name           = azurerm_dns_zone.raazresto_com.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ingress_ip]  # Use variable for Ingress external IP
}
