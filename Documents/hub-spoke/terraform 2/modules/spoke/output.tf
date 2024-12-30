# modules/spoke/outputs.tf
output "resource_group_name" {
  description = "Name of the spoke resource group"
  value       = azurerm_resource_group.spoke_rg.name
}
output "vnet_name" {
  description = "Name of the spoke virtual network"
  value       = azurerm_virtual_network.spoke_vnet.name
}

output "vnet_id" {
  description = "ID of the spoke virtual network"
  value       = azurerm_virtual_network.spoke_vnet.id
}



/*# modules/spoke/outputs.tf
output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_windows_virtual_machine.spoke_vm.name
}

output "vm_private_ip" {
  description = "Private IP address of the virtual machine"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}

output "vnet_id" {
  description = "ID of the spoke virtual network"
  value       = azurerm_virtual_network.spoke.id
}*/