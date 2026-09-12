variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "app_image_name" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "git_repo_url" {
  type = string
}

variable "git_branch" {
  type = string
}

variable "git_pat" {
  type      = string
  sensitive = true
}