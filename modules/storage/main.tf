# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  location                = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  //tags = var.tags
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.container_access_type
}

