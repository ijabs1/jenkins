variable "firewall_name" {
  description = "Name of the Azure Firewall"
  type        = string
}

variable "firewall_policy_name" {
  description = "Name of the Firewall Policy"
  type        = string
}

variable "firewall_pip_name" {
  description = "Name of the public IP for Firewall"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the existing Virtual Network"
  type        = string
}

variable "firewall_subnet_prefix" {
  description = "Address prefix for the Firewall subnet (must be at least /26)"
  type        = string
}


variable "firewall_sku" {
  description = "SKU name of the Firewall"
  type        = string
  default     = "AZFW_VNet"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
