# outputs.tf in root module
output "spoke1_vnet_name" {
  description = "Name of the spoke1 virtual network"
  value       = module.spoke1.vnet_name
}

output "spoke1_resource_group_name" {
  description = "Name of the spoke1 resource group"
  value       = module.spoke1.resource_group_name
}

output "spoke2_vnet_name" {
  description = "Name of the spoke2 virtual network"
  value       = module.spoke2.vnet_name
}

output "spoke2_resource_group_name" {
  description = "Name of the spoke2 resource group"
  value       = module.spoke2.resource_group_name
}