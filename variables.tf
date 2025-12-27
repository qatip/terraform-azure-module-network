#variable "vnet_address_space" {}
#variable "subnet_cidrs" {}
variable "location" {}
variable "prefix" {}
variable "resource_group_name" {}
variable "base_tags" {}
variable "nsg_id" {}


variable "vnet_address_space" {
  type        = string
  description = "CIDR for the Virtual Network address space."
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "Map of logical subnet name to CIDR."

  validation {
    condition = alltrue([
      for cidr in values(var.subnet_cidrs) :
      can(cidrhost(trimspace(cidr), 0))
    ])
    error_message = "All subnet_cidrs values must be valid."
  }
}