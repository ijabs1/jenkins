# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name = var.resource_group_name
}


# Public IP
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  allocation_method   = "Dynamic"

}

# Network Interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }

}

# Associate Network Security Group with Network Interface
resource "azurerm_network_interface_security_group_association" "nsg_nic_association" {
  //count                     = var.nsg_id != null ? 1 : 0
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = var.nsg_id
}

# Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  location            = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
}
