output "firewall_private_ip" {
  description = "The private IP of the Firewall"
  value       = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}

output "firewall_public_ip" {
  description = "The public IP of the Firewall"
  value       = azurerm_public_ip.firewall_pip.ip_address
}

output "firewall_id" {
  description = "The ID of the Firewall"
  value       = azurerm_firewall.firewall.id
}