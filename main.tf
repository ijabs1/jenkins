provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "az-training-rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet-az" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.az-training-rg.location
  resource_group_name = azurerm_resource_group.az-training-rg.name
}

# Network Security Group
resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = azurerm_resource_group.az-training-rg.location
  resource_group_name = azurerm_resource_group.az-training-rg.name
}

# Subnet
resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.az-training-rg.name
  virtual_network_name = azurerm_virtual_network.vnet-az.name
  address_prefixes     = var.subnet_address_prefixes
}

# Subnet and NSG Association
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

# Storage Account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.az-training-rg.name
  location                 = azurerm_resource_group.az-training-rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}
