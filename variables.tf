# Provider

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "shared_credentials_file" {
  type = string
}

variable "profile" {
  type    = string
  default = "terraform_user"
}

# General

variable "org_name" {
  type    = string
  default = "bootstrap-poc"
}

variable "workspace" {
  type = string
}

# EKS

variable "cluster_name" {
  type = string
}

# CodePipeline

# TODO: convert to list of names w/ count logic
variable "repo_name" {
  type = string
}

variable "repo_owner" {
  type = string
  default = "bcerney"
}
