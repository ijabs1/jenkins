output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet-aztraining-dev-uksouth-spoke1-shared.id
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet-aztraining-dev-uksouth-spoke1-shared.name
}

output "location" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
}