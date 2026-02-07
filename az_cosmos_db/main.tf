# Cosmos DB Account
resource "azurerm_cosmosdb_account" "cosmos" {
  name                          = "${var.name_prefix}-cosmos"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  offer_type                    = "Standard"
  kind                          = "GlobalDocumentDB"
  enable_automatic_failover     = true
  enable_multiple_write_locations = false
  public_network_access_enabled = false
  is_virtual_network_filter_enabled = true
  tags                          = var.tags

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = var.location
    failover_priority = 0
    zone_redundant    = true
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
    zone_redundant    = false
  }

  backup {
    type                = "Periodic"
    interval_in_minutes = var.backup_interval_minutes
    retention_in_hours  = var.backup_retention_hours
    storage_redundancy  = "Geo"
  }

  identity {
    type = "SystemAssigned"
  }

  capabilities {
    name = "EnableServerless"
  }

  # Network restrictions
  ip_range_filter = ""

  # Advanced threat protection
  analytical_storage {
    schema_type = "WellDefined"
  }
}

# Cosmos DB SQL Database
resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "${var.name_prefix}-cosmosdb"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

# Cosmos DB SQL Container
resource "azurerm_cosmosdb_sql_container" "container" {
  name                = "main-container"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
  database_name       = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths = ["/partitionKey"]

  autoscale_settings {
    max_throughput = var.max_throughput
  }

  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }
  }

  default_ttl = -1
}

# Private Endpoint for Cosmos DB
resource "azurerm_private_endpoint" "cosmos_pe" {
  name                = "${var.name_prefix}-cosmos-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.name_prefix}-cosmos-psc"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmos.id
    is_manual_connection           = false
    subresource_names              = ["Sql"]
  }

  private_dns_zone_group {
    name                 = "cosmos-dns-zone-group"
    private_dns_zone_ids = [var.cosmos_private_dns_zone_id]
  }
}

# Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "cosmos_diagnostics" {
  count                      = var.log_analytics_workspace_id != null ? 1 : 0
  name                       = "${var.name_prefix}-cosmos-diagnostics"
  target_resource_id         = azurerm_cosmosdb_account.cosmos.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "DataPlaneRequests"
  }

  enabled_log {
    category = "QueryRuntimeStatistics"
  }

  enabled_log {
    category = "PartitionKeyStatistics"
  }

  enabled_log {
    category = "PartitionKeyRUConsumption"
  }

  enabled_log {
    category = "ControlPlaneRequests"
  }

  metric {
    category = "Requests"
  }
}

