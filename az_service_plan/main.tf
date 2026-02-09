#Service Plan Module Outputs

locals {
  default_tags = {
    CreationDate = timestamp()
  }
  tags            = merge(local.default_tags, var.tags)
}

resource "azurerm_app_service_plan" "main" {
  name = join("-", [
    var.env_data.company.short_name,
    var.env_data.environment_name,
    var.env_data.location_short_name,
    lower(var.env_data.app.long_name),
    "asp"
  ])
  location            = var.env_data.location_name
  resource_group_name = var.resource_group.name
  kind                = local.kind
  reserved            = local.reserved

  sku {
    tier = local.sku_tier
    size = local.sku_size
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags["Application"],
      tags["BusinessOwner"],
      tags["computername"],
      tags["CostCenter"],
      tags["Cost Center"],
      tags["CreatedBy"],
      tags["CreatedOn"],
      tags["CreationDate"],
      tags["environment"],
      tags["Environment"],
      tags["Owner"],
      tags["PBI_APP"],
      tags["Platform"],
      tags["Purpose"],
      tags["Region"],
      tags["Requested By"],
      tags["SQLDBA"],
      tags["TechnicalOwner"],
      tags["Type"]
    ]
  }
}
