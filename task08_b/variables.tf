variable "name_prefix" {
  description = "Common prefix used to derive all resource names required by Task 08_b."
  type        = string
  default     = "cmtr-9y371ftl-mod8b"
}

variable "location" {
  description = "Azure region in which Task 08_b resources are deployed."
  type        = string
  default     = "West Europe"
}

variable "creator" {
  description = "Creator tag value applied to all resources required by the task."
  type        = string
  default     = "gevorg_hovhannisyan@epam.com"
}