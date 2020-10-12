output "vm_name" {
  description = "Name of the VM"
  value       = azurerm_virtual_machine.vmmgtvm.name
}

output "vm_pip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.pipmgtvm.id
}

output "resource_group" {
  description = "Resource Group where all VM resources deployed"
  value       = azurerm_resource_group.rgmgtvm.name
}