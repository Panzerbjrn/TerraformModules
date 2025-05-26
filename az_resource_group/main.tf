resource "azurerm_resource_group" "main" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = var.resource_group.tags
}
