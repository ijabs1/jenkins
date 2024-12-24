variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "uksouth"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default = {
    environment = "development"
  }
}