# App Service Module Variables

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

variable "app_subnet_id" {
  description = "Subnet ID for VNet integration"
  type        = string
}

variable "sku_name" {
  description = "SKU name for App Service Plan"
  type        = string
  default     = "P1v3"
}

variable "zone_balancing_enabled" {
  description = "Enable zone redundancy for high availability"
  type        = bool
  default     = false
}

variable "min_instances" {
  description = "Minimum number of instances for autoscaling"
  type        = number
  default     = 1
}

variable "max_instances" {
  description = "Maximum number of instances for autoscaling"
  type        = number
  default     = 3
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for diagnostics"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
