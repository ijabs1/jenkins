resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"  # This name is required by Azure
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.gateway_subnet_prefix]
}

resource "azurerm_public_ip" "gateway_pip" {
  name                = var.gateway_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  type     = "Vpn"
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.gateway_sku

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.gateway_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}