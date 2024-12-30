# modules/hub/main.tf
resource "azurerm_resource_group" "hub_rg" {
  name     = var.hub_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_vnet_name
  address_space       = var.hub_vnet_address_space
  location            = azurerm_resource_group.hub_rg.location
  resource_group_name = azurerm_resource_group.hub_rg.name
}

resource "azurerm_subnet" "hub_firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.hub_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = var.hub_firewall_subnet_prefix
}

resource "azurerm_public_ip" "firewall_pip" {
  name                = "firewall-public-ip"
  location            = azurerm_resource_group.hub_rg.location
  resource_group_name = azurerm_resource_group.hub_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "hub_firewall" {
  name                = var.firewall_name
  location            = azurerm_resource_group.hub_rg.location
  resource_group_name = azurerm_resource_group.hub_rg.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "firewall-config"
    subnet_id            = azurerm_subnet.hub_firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }
}


resource "azurerm_virtual_network_peering" "hub_to_spoke1" {
  name                      = "hub-to-${var.spoke1_vnet_name}-peering"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke1_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
  name                      = "hub-to-${var.spoke2_vnet_name}-peering"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke2_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}


resource "azurerm_route_table" "firewall_route" {
  name                          = "firewall-route-table"
  location                      = azurerm_resource_group.hub_rg.location
  resource_group_name           = azurerm_resource_group.hub_rg.name
  bgp_route_propagation_enabled = false

  route {
    name           = "route-to-firewall"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.hub_firewall.ip_configuration[0].private_ip_address
  }
}

# Add to modules/hub/main.tf
resource "azurerm_firewall_network_rule_collection" "spoke1_network_rules" {
  name                = "spoke1-network-rule-collection"
  azure_firewall_name = azurerm_firewall.hub_firewall.name
  resource_group_name = azurerm_resource_group.hub_rg.name
  priority            = 100
  action              = "Deny"

  rule {
    name = "spoke1-no-internet"
    source_addresses = var.spoke1_vm_subnet_prefix
    destination_ports = ["*"]
    destination_addresses = ["*"]
    protocols = ["Any"]
  }
}

resource "azurerm_firewall_application_rule_collection" "spoke2_app_rules" {
  name                = "spoke2-app-rules"
  azure_firewall_name = azurerm_firewall.hub_firewall.name
  resource_group_name = azurerm_resource_group.hub_rg.name
  priority            = 100
  action              = "Deny"

  rule {
    name = "block-google"
    source_addresses = var.spoke2_vm_subnet_prefix 
    target_fqdns = ["www.google.com"]
    
    protocol {
      type = "Http"
      port = "80"
    }
    
    protocol {
      type = "Https"
      port = "443"
    }
  }
}