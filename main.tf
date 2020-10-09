resource "azurerm_public_ip" "pipmgtvm" {
  name                = "cdwmgtvm-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nicmgtvm" {
  name                = "cdwmgtvm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.azurerm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_machine" "vmmgtvm" {
  name                  = "cdw-mgtvm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nicmgtvm.id]
  vm_size               = "Standard_B2s"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "cdw-mgtvm-OsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "cdw-mgtvm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = false
    storage_uri = "https://bootdiaglum.blob.core.windows.net/"
  }
}

resource "azurerm_network_security_group" "nsgmgtvm" {
  name                = "nsg-cdw-mgtvm"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "nsgwinremoterule" {
  name                        = "cdw-RdpRemoteAccess"
  resource_group_name         = var.resource_group_name
  priority                    = 140
  access                      = "Allow"
  direction                   = "Inbound"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = 3389
  destination_address_prefix  = "*"
  source_address_prefixes     = var.remote_mgt_ips
  network_security_group_name = azurerm_network_security_group.nsgmgtvm.name
}

resource "azurerm_network_interface_security_group_association" "nsgassmgtvm" {
  network_interface_id                 = azurerm_network_interface.nicmgtvm.id
  network_security_group_id = azurerm_network_security_group.nsgmgtvm.id
}