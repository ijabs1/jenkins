variable "storage_account_name" {
  description = "Environment tag for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication type for the storage account (LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "The name of the container to be created in the storage account."
  type        = string
}

variable "container_access_type" {
  description = "The access type of the container (private, blob, or container)."
  type        = string
  default     = "private"
}