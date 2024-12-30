# modules/hub/variables.tf
variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}


variable "spoke1_vnet_name" {
  description = "Name of the first spoke virtual network"
  type        = string
}

variable "spoke2_vnet_name" {
  description = "Name of the second spoke virtual network"
  type        = string
}

variable "spoke1_resource_group_name" {
  description = "Resource group name for the first spoke network"
  type        = string
}

variable "spoke2_resource_group_name" {
  description = "Resource group name for the second spoke network"
  type        = string
}

variable "hub_resource_group_name" {
  description = "Name of the hub resource group"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "Address space for the hub virtual network"
  type        = list(string)
}

variable "hub_firewall_subnet_prefix" {
  description = "Address prefix for the Azure Firewall subnet"
  type        = list(string)
}

variable "firewall_name" {
  description = "Name of the Azure Firewall"
  type        = string
}

variable "spoke1_vm_subnet_prefix" {
  description = "Address prefix for spoke1 VM subnet"
  type        = list(string)
}

variable "spoke2_vm_subnet_prefix" {
  description = "Address prefix for spoke2 VM subnet"
  type        = list(string)
}

variable "spoke1_vnet_id" {
  description = "ID of the first spoke virtual network"
  type        = string
}

variable "spoke2_vnet_id" {
  description = "ID of the second spoke virtual network"
  type        = string
}


/*
# modules/hub/variables.tf
variable "resource_group_name" {
  description = "Name of the hub resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the hub resources"
  type        = string
  default     = "uksouth"
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the hub virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "spoke_vnets" {
  description = "List of spoke virtual network names"
  type        = list(string)
}

*/