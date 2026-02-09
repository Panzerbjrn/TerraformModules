#Service Plan Module Outputs

output "resource_id" {
  value = azurerm_app_service_plan.main.id
}

output "name" {
  value = azurerm_app_service_plan.main.name
}

output "sku" {
  value = local.sku
}
