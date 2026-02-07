# Cosmos DB Module Outputs

output "cosmos_account_id" {
  value = azurerm_cosmosdb_account.cosmos.id
}

output "cosmos_account_name" {
  value = azurerm_cosmosdb_account.cosmos.name
}

output "cosmos_endpoint" {
  value = azurerm_cosmosdb_account.cosmos.endpoint
}

output "cosmos_primary_key" {
  value     = azurerm_cosmosdb_account.cosmos.primary_key
  sensitive = true
}

output "cosmos_connection_strings" {
  value     = azurerm_cosmosdb_account.cosmos.connection_strings
  sensitive = true
}

output "cosmos_identity_principal_id" {
  value = azurerm_cosmosdb_account.cosmos.identity[0].principal_id
}

output "database_name" {
  value = azurerm_cosmosdb_sql_database.db.name
}

output "container_name" {
  value = azurerm_cosmosdb_sql_container.container.name
}

output "private_endpoint_ip" {
  value = azurerm_private_endpoint.cosmos_pe.private_service_connection[0].private_ip_address
}

