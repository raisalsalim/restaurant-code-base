
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}
