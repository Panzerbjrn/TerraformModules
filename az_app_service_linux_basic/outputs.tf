# App Service Module Outputs
output "app_service_id" {
  value = azurerm_linux_web_app.app.id
}

output "app_service_name" {
  value = azurerm_linux_web_app.app.name
}

output "app_service_default_hostname" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "app_service_identity_principal_id" {
  value = azurerm_linux_web_app.app.identity[0].principal_id
}

output "app_insights_instrumentation_key" {
  value     = azurerm_application_insights.app_insights.instrumentation_key
  sensitive = true
}

output "app_insights_connection_string" {
  value     = azurerm_application_insights.app_insights.connection_string
  sensitive = true
}

