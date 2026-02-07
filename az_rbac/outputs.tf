# RBAC Module Outputs

output "custom_role_id" {
  value = azurerm_role_definition.app_db_access.id
}

output "custom_role_name" {
  value = azurerm_role_definition.app_db_access.name
}

