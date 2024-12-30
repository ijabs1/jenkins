# modules/spoke/variables.tf
variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "spoke_resource_group_name" {
  description = "Name of the spoke resource group"
  type        = string
}

variable "spoke_vnet_name" {
  description = "Name of the spoke virtual network"
  type        = string
}

variable "spoke_vnet_address_space" {
  description = "Address space for the spoke virtual network"
  type        = list(string)
}

variable "spoke_vm_subnet_prefix" {
  description = "Address prefix for the spoke VM subnet"
  type        = list(string)
}

variable "hub_vnet_id" {
  description = "ID of the hub virtual network for peering"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "firewall_route_table_id" {
  description = "ID of the firewall route table"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}



/*
# modules/spoke/variables.tf
variable "resource_group_name" {
  description = "Name of the spoke resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the spoke resources"
  type        = string
  default     = "uksouth"
}

variable "vnet_address_space" {
  description = "Address space for the spoke virtual network"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}

variable "vnet_name" {
  description = "Name of the spoke virtual network"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "hub_vnet_id" {
  description = "ID of the hub virtual network for peering"
  type        = string
}

variable "firewall_rules" {
  description = "Firewall rule configuration for the spoke"
  type = object({
    internet_access = optional(bool, true)
    blocked_sites   = optional(list(string), [])
  })
  default = {
    internet_access = true
    blocked_sites   = []
  }
}
*/