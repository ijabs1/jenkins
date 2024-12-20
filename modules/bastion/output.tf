output "bastion_host_id" {
  description = "The ID of the Bastion Host"
  value       = azurerm_bastion_host.bastion.id
}

output "bastion_public_ip" {
  description = "The public IP of the Bastion Host"
  value       = azurerm_public_ip.bastion_pip.ip_address
}

output "subnet_id" {
  description = "The ID of the Bastion subnet"
  value       = azurerm_subnet.bastion_subnet.id
}
/*
variable "my-bastion-pip" {
  description = "Name of the public IP for Bastion Host"
  type        = azurerm_public_ip.bastion_pip.name
}*/