variable "name_prefix" {
  type    = string
  default = "cmtr-9y371ftl-mod8"
}

variable "redis_unique_suffix" {
  type    = string
  default = "1789225950"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "creator" {
  type    = string
  default = "gevorg_hovhannisyan@epam.com"
}

variable "git_repo_url" {
  type = string
}

variable "git_branch" {
  type    = string
  default = "main"
}

variable "git_pat" {
  type      = string
  sensitive = true
}