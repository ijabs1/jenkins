output "nsg_id" {
  value = azurerm_network_security_group.nsg-aztraining-dev-uks.id
}

output "subnet_id" {
  description = "The ID of the created subnet."
  value       = var.subnet_id
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}