output "vm_name" {
  description = "Name of the VM"
  value       = azurerm_virtual_machine.vmmgtvm.name
}

output "vm_pip" {
  description = "Public IP address of the VM"
  value       = data.azurerm_public_ip.pip.ip_address
}