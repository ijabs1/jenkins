# variables.tf

# variables.tf
variable "location" {
  description = "Primary location for resources"
  type        = string
}

variable "hub_resource_group_name" {
  description = "Resource group name for hub network"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "Address space for hub virtual network"
  type        = list(string)
}

variable "hub_firewall_subnet_prefix" {
  description = "Subnet prefix for Azure Firewall"
  type        = list(string)
}

variable "firewall_name" {
  description = "Name of the Azure Firewall"
  type        = string
}

variable "spoke1_vm_subnet_prefix" {
  description = "Subnet prefix for Spoke 1 VM"
  type        = list(string)
}

variable "spoke2_vm_subnet_prefix" {
  description = "Subnet prefix for Spoke 2 VM"
  type        = list(string)
}

variable "spoke_resource_group_names" {
  description = "Resource group name for Spoke 1 network"
  type        = list(string)
}

variable "spoke_vnet_names" {
  description = "Name of Spoke 1 virtual network"
  type        = list(string)
}

variable "spoke_vnet_address_spaces" {
  description = "Address space for Spoke 1 virtual network"
  type        = list(list(string))
}

variable "vm_names" {
  description = "Name of Spoke 1 VM"
  type        = list(string)
}

/*
variable "spoke2_location" {
  description = "Location for Spoke 2 resources"
  type        = string
} */


variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_F2"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

/*
variable "spoke2_resource_group_name" {
  description = "Resource group name for Spoke 2 network"
  type        = string
}

variable "spoke2_vnet_name" {
  description = "Name of Spoke 2 virtual network"
  type        = string
}  


variable "spoke2_vnet_address_space" {
  description = "Address space for Spoke 2 virtual network"
  type        = list(string)
}

variable "spoke2_vm_name" {
  description = "Name of Spoke 2 VM"
  type        = string
}

*/
variable "admin_username" {
  description = "Administrator username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for VMs"
  type        = string
  sensitive   = true
}











variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
/*
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}




variable "location" {
  description = "Short name for the Azure region"
  type        = string
  default     = "uksouth"
}

variable "hub_resource_group_name" {
  description = "Name of the hub resource group"
  type        = string
}

variable "spoke_resource_group_names" {
  description = "Names of the spoke resource groups"
  type        = list(string)
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "spoke_vnet_names" {
  description = "Names of the spoke virtual networks"
  type        = list(string)
}


variable "firewall_name" {
  description = "Name of the hub virtual network"
  type        = string
}


variable "vm_names" {
  description = "Names of the virtual machines in each spoke"
  type        = list(string)
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "Administrator username for VMs"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "Administrator password for VMs"
  type        = string
  sensitive   = true
}

variable "hub_vnet_address_space" {
  description = "Address space for the hub VNet"
  type        = list(string)
}

variable "hub_firewall_subnet_prefix" {
  description = "Address space for the hub VNet"
  type        = list(string)
}

variable "spoke1_vm_subnet_prefix " {
  description = "Address space for the hub VNet"
  type        = list(string)
}

variable "spoke2_vm_subnet_prefix " {
  description = "Address space for the spoke subnet"
  type        = list(string)
}

variable "spoke_vnet_address_spaces" {
  description = "Address spaces for spoke VNets"
  type        = list(list(string))
}

variable "spoke_firewall_rules" {
  description = "Firewall rules for each spoke"
  type = list(object({
    internet_access = bool
    blocked_sites   = optional(list(string), [])
  }))
}

*/