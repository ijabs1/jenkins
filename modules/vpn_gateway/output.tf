output "gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = azurerm_virtual_network_gateway.vpn_gateway.id
}

output "gateway_public_ip" {
  description = "The public IP of the VPN Gateway"
  value       = azurerm_public_ip.gateway_pip.ip_address
}