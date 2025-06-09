# variable "resource_group" {
#   type = object({
#     name     = string
#     location = string
#     tags     = map(string)
#   })
# }

variable "RG_Map" {
  type = list(object({
    name        = string
    function    = string
    instance_id = string
    location    = string
    tags        = map(string)
  }))
  description = "List of Resource Groups with their properties for module usage."
  default     = []
}