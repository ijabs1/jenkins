# modules/spoke/main.tf
resource "azurerm_resource_group" "spoke_rg" {
  name     = var.spoke_resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  address_space       = var.spoke_vnet_address_space
  location            = azurerm_resource_group.spoke_rg.location
  resource_group_name = azurerm_resource_group.spoke_rg.name

  tags = var.tags
}

resource "azurerm_subnet" "spoke_vm_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.spoke_rg.name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.spoke_vm_subnet_prefix
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "${var.spoke_vnet_name}-to-hub-peering"
  resource_group_name       = azurerm_resource_group.spoke_rg.name
  virtual_network_name      = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_subnet_route_table_association" "spoke_subnet_route" {
  subnet_id      = azurerm_subnet.spoke_vm_subnet.id
  route_table_id = var.firewall_route_table_id
}

resource "azurerm_network_interface" "spoke_nic" {
  name                = "${var.spoke_vnet_name}-vm-nic"
  location            = azurerm_resource_group.spoke_rg.location
  resource_group_name = azurerm_resource_group.spoke_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke_vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "spoke_vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.spoke_rg.name
  location            = azurerm_resource_group.spoke_rg.location
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.spoke_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

/*
# modules/spoke/main.tf
resource "azurerm_resource_group" "spoke" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "spoke" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.spoke.location
  resource_group_name = azurerm_resource_group.spoke.name
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.spoke.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0], 8, 1)]
}

# Network Interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.spoke.location
  resource_group_name = azurerm_resource_group.spoke.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine
resource "azurerm_windows_virtual_machine" "spoke_vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.spoke.location
  resource_group_name   = azurerm_resource_group.spoke.name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = var.vm_size

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  computer_name  = var.vm_name
  admin_username = var.admin_username
  admin_password = var.admin_password
}

# VNet Peering to Hub
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "peer-${var.vnet_name}-to-hub"
  resource_group_name       = azurerm_resource_group.spoke.name
  virtual_network_name      = azurerm_virtual_network.spoke.name
  remote_virtual_network_id = var.hub_vnet_id
}

# Network Rules for Internet Access and Site Blocking
# Azure Firewall Policy
resource "azurerm_firewall_policy" "spoke_policy" {
  name                = "${var.vnet_name}-firewall-policy"
  resource_group_name = azurerm_resource_group.spoke.name
  location            = azurerm_resource_group.spoke.location
}


resource "azurerm_firewall_policy_rule_collection_group" "spoke_rules" {
  name               = "${var.vnet_name}-rule-collection-group"
  firewall_policy_id = azurerm_firewall_policy.spoke_policy.id
  priority           = 500

  network_rule_collection {
    name     = "network-rule-collection"
    priority = 400
    action   = var.firewall_rules.internet_access ? "Allow" : "Deny"

    # If internet access is disabled, this will effectively block all traffic
    rule {
      name                  = "deny-all-internet"
      protocols             = ["Any"]
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }

  # Application rules for specific site blocking
  dynamic "application_rule_collection" {
    for_each = length(var.firewall_rules.blocked_sites) > 0 ? [1] : []
    content {
      name     = "block-specific-sites"
      priority = 300
      action   = "Deny"

      dynamic "rule" {
        for_each = var.firewall_rules.blocked_sites
        content {
          name = "block-${replace(rule.value, ".", "-")}"
          
          protocols {
            type = "Http"
            port = 80
          }
          protocols {
            type = "Https"
            port = 443
          }

          source_addresses = ["*"]
          destination_fqdns = [rule.value]
        }
      }
    }
  }
}
*/