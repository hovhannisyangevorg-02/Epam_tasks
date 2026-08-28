variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "nic_name" {
  description = "Network interface name"
  type        = string
}

variable "nsg_name" {
  description = "Network security group name"
  type        = string
}

variable "nsg_rule_http" {
  description = "NSG HTTP rule name"
  type        = string
}

variable "nsg_rule_ssh" {
  description = "NSG SSH rule name"
  type        = string
}

variable "public_ip" {
  description = "Public IP name"
  type        = string
}

variable "domain_name_label" {
  description = "DNS name label"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "vm_os_version" {
  description = "Virtual machine OS version"
  type        = string
}

variable "vm_sku" {
  description = "Virtual machine SKU"
  type        = string
}

variable "student_email" {
  description = "Student email used for resource tags"
  type        = string
}

variable "vm_password" {
  description = "Administrator password for the virtual machine"
  type        = string
  sensitive   = true
}