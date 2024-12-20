# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name = var.resource_group_name
}

# Virtual Network
resource "azurerm_virtual_network" "vnet-aztraining-dev-uksouth-spoke1-shared" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  virtual_network_name = azurerm_virtual_network.vnet-aztraining-dev-uksouth-spoke1-shared.name
  address_prefixes     = var.subnet_address_prefixes
}

 