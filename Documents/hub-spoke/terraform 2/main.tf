# main.tf
# main.tf
provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
  //tenant_id       = var.tenant_id
}

module "hub" {
  source                     = "./modules/hub"
  location                   = var.location
  hub_resource_group_name    = var.hub_resource_group_name
  hub_vnet_name              = var.hub_vnet_name
  spoke1_vnet_id             = module.spoke1.vnet_id
  spoke2_vnet_id             = module.spoke2.vnet_id
  spoke1_vnet_name            = module.spoke1.vnet_name
  spoke2_vnet_name            = module.spoke2.vnet_name
  spoke1_resource_group_name  = module.spoke1.resource_group_name
  spoke2_resource_group_name  = module.spoke2.resource_group_name
  hub_vnet_address_space     = var.hub_vnet_address_space
  hub_firewall_subnet_prefix = var.hub_firewall_subnet_prefix
  firewall_name              = var.firewall_name
  spoke1_vm_subnet_prefix    = var.spoke1_vm_subnet_prefix
  spoke2_vm_subnet_prefix    = var.spoke2_vm_subnet_prefix
}

module "spoke1" {
  source                    = "./modules/spoke"
  location                  = var.location
  spoke_resource_group_name = var.spoke_resource_group_names[0]
  spoke_vnet_name           = var.spoke_vnet_names[0]
  spoke_vnet_address_space  = var.spoke_vnet_address_spaces[0]
  spoke_vm_subnet_prefix    = var.spoke1_vm_subnet_prefix
  hub_vnet_id               = module.hub.hub_vnet_id
  vm_name                   = var.vm_names[0]
  admin_username            = var.admin_username
  admin_password            = var.admin_password
  firewall_route_table_id   = module.hub.firewall_route_table_id

  tags = merge(var.tags, {
    layer = "spoke1"
  })
}

module "spoke2" {
  source                    = "./modules/spoke"
  location                  = var.location
  spoke_resource_group_name = var.spoke_resource_group_names[1]
  spoke_vnet_name           = var.spoke_vnet_names[1]
  spoke_vnet_address_space  = var.spoke_vnet_address_spaces[1]
  spoke_vm_subnet_prefix    = var.spoke2_vm_subnet_prefix
  hub_vnet_id               = module.hub.hub_vnet_id
  vm_name                   = var.vm_names[1]
  admin_username            = var.admin_username
  admin_password            = var.admin_password
  firewall_route_table_id   = module.hub.firewall_route_table_id

  tags = merge(var.tags, {
    layer = "spoke2"
  })
}

/*# main.tf
provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
  //tenant_id       = var.tenant_id
}

# Hub Module
module "hub" {
  source = "./modules/hub"

  resource_group_name = var.hub_resource_group_name
  location            = var.region_shortname
  hub_vnet_name       = var.hub_vnet_name
  vnet_address_space  = var.hub_vnet_address_space
  
  spoke_vnets = var.spoke_vnet_names
}

module "spoke1" {
  source = "./modules/spoke"

  resource_group_name = var.spoke_resource_group_names[0]
  location            = var.region_shortname
  vnet_name           = var.spoke_vnet_names[0]
  vm_name             = var.vm_names[0]
  hub_vnet_id         = module.hub.hub_vnet_id
  vnet_address_space  = var.spoke_vnet_address_spaces[0]
  
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  
  firewall_rules = var.spoke_firewall_rules[0]
}

module "spoke2" {
  source = "./modules/spoke"

  resource_group_name = var.spoke_resource_group_names[1]
  location            = var.region_shortname
  vnet_name           = var.spoke_vnet_names[1]
  vm_name             = var.vm_names[1]
  hub_vnet_id         = module.hub.hub_vnet_id
  vnet_address_space  = var.spoke_vnet_address_spaces[1]
  
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  
  firewall_rules = var.spoke_firewall_rules[1]
}

/*
module "spoke3" {
  source = "./modules/spoke"

  resource_group_name = var.spoke_resource_group_names[2]
  location            = var.region_shortname
  vnet_name           = var.spoke_vnet_names[2]
  vm_name             = var.vm_names[2]
  hub_vnet_id         = module.hub.hub_vnet_id
  vnet_address_space  = var.spoke_vnet_address_spaces[2]
  
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  
  firewall_rules = var.spoke_firewall_rules[2]
}*/

