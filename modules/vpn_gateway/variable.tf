variable "gateway_name" {
  description = "Name of the VPN Gateway"
  type        = string
}

variable "gateway_pip_name" {
  description = "Name of the public IP for VPN Gateway"
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

variable "gateway_subnet_prefix" {
  description = "Address prefix for the Gateway subnet (must be at least /27)"
  type        = string
}

variable "vpn_type" {
  description = "VPN type - RouteBased or PolicyBased"
  type        = string
  default     = "RouteBased"
}

variable "gateway_sku" {
  description = "SKU of the VPN Gateway"
  type        = string
  default     = "VpnGw1"
}

variable "active_active" {
  description = "Enable active-active mode"
  type        = bool
  default     = false
}

variable "enable_bgp" {
  description = "Enable BGP"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
