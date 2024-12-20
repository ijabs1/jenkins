variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine. Used for naming the NSG."
  type        = string
}

variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
}

variable "location" {
  description = "The Azure location where resources will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the NSG."
  type        = string
}