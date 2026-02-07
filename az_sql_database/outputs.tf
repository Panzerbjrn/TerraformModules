# Azure SQL Database Module Outputs

output "sql_server_id" {
  value = azurerm_mssql_server.sql_server.id
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_database_id" {
  value = azurerm_mssql_database.sql_db.id
}

output "sql_database_name" {
  value = azurerm_mssql_database.sql_db.name
}

output "sql_server_identity_principal_id" {
  value = azurerm_mssql_server.sql_server.identity[0].principal_id
}

output "private_endpoint_ip" {
  value = azurerm_private_endpoint.sql_pe.private_service_connection[0].private_ip_address
}

