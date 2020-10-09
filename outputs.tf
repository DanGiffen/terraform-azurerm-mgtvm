// output

output "vm_name" {
    description = "Name of the VM"
    value = azurerm_virtual_machine.cdw-mgtvm.name
}

output "resource_group" {
    description = "Resource Group where all VM resources deployed"
    value = azurerm_resource_group.rgmgtvm.name
}