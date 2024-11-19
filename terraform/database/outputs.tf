
output "postgresql_host" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_username" {
  value = azurerm_postgresql_flexible_server.postgresql.administrator_login
}

output "postgresql_password" {
  value = azurerm_postgresql_flexible_server.postgresql.administrator_password
  sensitive = true
}
