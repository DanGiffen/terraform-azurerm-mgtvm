variable "subnet_id" {
  description = "Subnet ID for VM NIC association"
  type        = string
}

variable "admin_username" {
  description = "Windows local administrator username"
  type        = string
}

variable "admin_password" {
  description = "Windows local administrator password"
  type        = string
}


variable "location" {
  description = "Regional Location"
  type        = string
}


variable "remote_mgt_ips" {
  description = "List of remote IPs that can access VM PIP on RDP Port"
  type        = list(string)
  default = ["194.105.149.2/32"] // ServiceWorks
}


variable "resource_group_name" {
  description = "Resource Group for all module resources"
  type        = string
  default = "rg-cdw-mgmtvm"

}

variable "tags" {
  description = "Resource tags deployed with this module"
  type        = map(string)
  default = {
    deployment = "terraform"
    owner      = "cdw"
  }

}

    