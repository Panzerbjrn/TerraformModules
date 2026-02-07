# Monitoring Module Variables

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "app_service_id" {
  description = "App Service ID for monitoring"
  type        = string
}

variable "sql_database_id" {
  description = "SQL Database ID for monitoring"
  type        = string
}

variable "cosmos_account_id" {
  description = "Cosmos DB Account ID for monitoring"
  type        = string
}

variable "alert_email" {
  description = "Email address for alert notifications"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

