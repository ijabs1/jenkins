# Outputs
output "resource_group_name" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}


output "vm_public_ip" {
  value = module.virtual_machine.vm_public_ip
}


output "admin_username" {
  value = var.admin_username
}

output "virtual_network_name" {
  value = module.vnet.vnet_name
}
