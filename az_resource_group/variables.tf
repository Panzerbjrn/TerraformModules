# Resource Group Module Variables
variable "name" {
  description = "Name of the resource group"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region for resource group"
  type        = string
  default     = "northeurope"

  validation {
    condition     = contains(["northeurope", "uksouth", "ukwest"], var.location)
    error_message = "Location must be from the approved list of regions."
  }
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}


variable "resource_group" {
  type = object({
    name     = string
    location = string
    tags     = map(string)
  })
  default     = {
    name     = null
    location = null
    tags     = {}
  }
}
