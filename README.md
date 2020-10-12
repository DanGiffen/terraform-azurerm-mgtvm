# Azure Windows Management VM

This module creates a small Windows VM for management and testing purposes.

## Input

| Name | Description | Type |
| ---- | ----------- | ----
| azurerm_subnet_id | subnet the vm nic is connected to | string |
| resource_group_name  | resource group | string |
| location | resource location | string |
| admin_username | windows local admin username | string |
| admin_password | windows local admin password | string |
| remote_mgt_ips | source management IP address | string |
| tags | resource tags | string |

## Output

| Name | Description |
| ---- | ----------- |
| | |
