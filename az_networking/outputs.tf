# Networking Module Outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint_subnet.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database_subnet.id
}

output "sql_private_dns_zone_id" {
  value = azurerm_private_dns_zone.sql.id
}

output "cosmos_private_dns_zone_id" {
  value = azurerm_private_dns_zone.cosmos.id
}

