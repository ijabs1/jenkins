variable "resource_group_name" {
  description = "Name of the resource group"
  default = "rg-az-training-ola"
}

variable "location" {
  description = "Azure region"
  default     = "UKSouth"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  default = "vnet-az-training-ola"
}


variable "vnet_address_space" {
  description = "Address space for the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "nsg_name" {
  description = "Name of the network security group"
  default = "nsg-az-training-ola"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default = "subnet-az-training-ola"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  default     = ["10.0.1.0/24"]
}

variable "storage_account_name" {
  description = "Name of the storage account"
  default = "sa-az-training-ola"
}

variable "storage_account_tier" {
  description = "Tier of the storage account"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Replication type for the storage account"
  default     = "LRS"
}
