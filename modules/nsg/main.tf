# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name     = var.resource_group_name
  //location = var.location
}


# Network Security Group
resource "azurerm_network_security_group" "nsg-aztraining-dev-uks" {
  name                = "${var.vm_name}-nsg"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet and NSG Association
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg-aztraining-dev-uks.id
}