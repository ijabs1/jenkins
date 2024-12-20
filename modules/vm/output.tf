output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}

output "vm_id" {
  description = "ID of the created virtual machine"
  value       = azurerm_windows_virtual_machine.windows_vm.id
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}