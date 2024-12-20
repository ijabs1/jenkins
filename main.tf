

# Call the v-net module
module "vnet" {
  source                  = "./modules/vnet"
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  location                = var.location
}

# Call the virtual machine module
module "virtual_machine" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.vnet.subnet_id
  nsg_id              = module.nsg.nsg_id
  os_publisher        = var.os_publisher
  os_offer            = var.os_offer
  os_sku              = var.os_sku
  os_version          = var.os_version
}

# Call the nsg module
module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  nsg_name            = var.nsg_name
  subnet_id           = module.vnet.subnet_id
  vm_name             = var.vm_name
  // network_security_group_id = azurerm_network_security_group.nsg-aztraining-dev-uks.id
}


# Call the bastion module
module "bastion" {
  source                = "./modules/bastion"
  bastion_host_name     = var.bastion_host_name
  bastion_pip_name      = var.bastion_pip_name
  location              = module.vnet.location
  resource_group_name   = module.vnet.resource_group_name
  virtual_network_name  = module.vnet.vnet_name
  subnet_address_prefix = "10.0.1.0/27" # Adjust according to your network design

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

# Call the firewall module
module "firewall" {
  source                 = "./modules/firewall"
  firewall_name          = "my-firewall"
  firewall_policy_name   = "my-firewall-policy"
  firewall_pip_name      = "my-firewall-pip"
  location               = module.vnet.location
  resource_group_name    = module.vnet.resource_group_name
  virtual_network_name   = module.vnet.vnet_name
  firewall_subnet_prefix = "10.0.2.0/26"
  firewall_sku           = "Standard"

  //tags = local.tags
}

# Call the VPN Gateway module
module "vpn_gateway" {
  source                = "./modules/vpn_gateway"
  gateway_name          = "my-vpn-gateway"
  gateway_pip_name      = "my-vpn-gateway-pip"
  location              = module.vnet.location
  resource_group_name   = module.vnet.resource_group_name
  virtual_network_name  = module.vnet.vnet_name
  gateway_subnet_prefix = "10.0.3.0/27"
  vpn_type              = "RouteBased"
  gateway_sku           = "VpnGw1"

  //tags = local.tags
}

# Call the Storage module
module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
  location             = var.location
  container_name      = var.container_name
  account_tier        = "Standard"
  replication_type    = "LRS"
  container_access_type = "private"
}

data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name = var.resource_group_name
}