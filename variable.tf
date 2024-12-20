variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  //default     = "eastus"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
}

variable "os_publisher" {
  description = "OS Image Publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "os_offer" {
  description = "OS Image Offer"
  type        = string
  default     = "WindowsServer"
}

variable "os_sku" {
  description = "OS Image SKU"
  type        = string
  default     = "2022-Datacenter"
}

variable "os_version" {
  description = "OS Image Version"
  type        = string
  default     = "latest"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}


variable "container_name" {
  description = "The name of the storage account container"
  type        = string
}

variable "bastion_host_name" {
  description = "The name of the bastion host name"
  type        = string
}

variable "bastion_pip_name" {
  description = "The name of the bastion host name"
  type        = string
}