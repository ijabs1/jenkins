
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vm_name" {
  description = "Name of the Windows Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "subnet_id" {
  description = "The ID of the subnet to attach the network interface to."
  type        = string
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
}

variable "admin_password" {
  description = "Administrator password"
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

variable "nsg_id" {
  description = "ID of the network security group"
  type        = string
  //default     = null
}