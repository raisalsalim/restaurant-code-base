
resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  sku                      = "Basic"
  admin_enabled            = true

  tags = {
    environment = "production"
  }  
}

# Assign the "AcrPull" role to the AKS managed identity for accessing ACR
#resource "azurerm_role_assignment" "aks_acr_pull" {
#  depends_on = [azurerm_container_registry.acr]
#
#  principal_id         = var.aks_principal_id
#  role_definition_name = "AcrPull"
#  scope                = azurerm_container_registry.acr.id
#}

resource "null_resource" "aks_attach_acr" {
  depends_on = [azurerm_container_registry.acr]

  provisioner "local-exec" {
    command = "az aks update -n ${var.aks_cluster_name} -g ${var.resource_group_name} --attach-acr ${azurerm_container_registry.acr.name}"
  }
}
