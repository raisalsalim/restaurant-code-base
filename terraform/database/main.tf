
resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                         = "pg-backend-server"
  location                     = var.resource_group_location
  resource_group_name          = var.resource_group_name
  administrator_login          = var.admin_username
  administrator_password       = var.admin_password
  version                      = "13"
  sku_name                     = "GP_Standard_D2s_v3"
  zone                         = "1"

  high_availability {
    mode                        = "ZoneRedundant"
    standby_availability_zone   = "2"
  }

  timeouts {
    create = "30m"
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_ip" {
  name                = "allow-localhost"
  server_id           = azurerm_postgresql_flexible_server.postgresql.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name                = "backenddb"
  server_id           = azurerm_postgresql_flexible_server.postgresql.id
  charset             = "UTF8"
}

