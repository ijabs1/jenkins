# modules/hub/outputs.tf
output "hub_resource_group_name" {
  description = "Name of the hub resource group"
  value       = azurerm_resource_group.hub_rg.name
}

output "hub_vnet_id" {
  description = "ID of the hub virtual network"
  value       = azurerm_virtual_network.hub_vnet.id
}

output "hub_firewall_private_ip" {
  description = "Private IP address of the Azure Firewall"
  value       = azurerm_firewall.hub_firewall.ip_configuration[0].private_ip_address
}

output "firewall_route_table_id" {
  description = "ID of the firewall route table"
  value       = azurerm_route_table.firewall_route.id
}

output "hub_to_spoke1_peering_id" {
  description = "ID of the peering from hub to spoke1"
  value       = azurerm_virtual_network_peering.hub_to_spoke1.id
}

output "hub_to_spoke2_peering_id" {
  description = "ID of the peering from hub to spoke2"
  value       = azurerm_virtual_network_peering.hub_to_spoke2.id
}



/*# modules/hub/outputs.tf
output "hub_vnet_id" {
  description = "ID of the hub virtual network"
  value       = azurerm_virtual_network.hub.id
}

output "firewall_public_ip" {
  description = "Public IP address of the Azure Firewall"
  value       = azurerm_public_ip.firewall_pip.ip_address
}*/