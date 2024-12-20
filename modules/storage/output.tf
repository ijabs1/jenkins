output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "storage_account_name" {
  description = "Name of the created storage account"
  value       = azurerm_storage_account.storage_account.name
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint for the storage account."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_container_name" {
  description = "The name of the created storage container."
  value       = azurerm_storage_container.storage_container.name
}
