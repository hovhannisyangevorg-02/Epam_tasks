variable "name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure location of the Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags assigned to the Resource Group"
  type        = map(string)
}