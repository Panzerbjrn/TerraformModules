locals {

  name     = var.resource_group.name == null ? var.name : var.resource_group.name
  location = var.resource_group.location == null ? var.location : var.resource_group.location
  tags     = var.resource_group.tags == null ? var.tags : var.resource_group.tags

}
resource "azurerm_resource_group" "main" {
  name     = local.name
  location = local.location
  tags     = local.tags
}
