variable "bastion_host_name" {
  description = "Name of the Azure Bastion Host"
  type        = string
}

variable "bastion_pip_name" {
  description = "Name of the public IP for Bastion Host"
  type        = string
}
/*
variable "my-bastion-pip" {
  description = "Name of the public IP for Bastion Host"
  type        = string
}
*/

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the existing Virtual Network"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the Bastion subnet (must be at least /27)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}