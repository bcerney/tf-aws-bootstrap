# Provider

# variable "region" {
#   default = "us-east-2"
# }

# variable "shared_credentials_file" {
#   type = string
# }

# variable "profile" {
#   default = "terraform_user"
# }

# General

# variable "org_name" {
#   default = "bootstrap-poc"
# }


# CodePipeline

# TODO: convert to list of names w/ count logic
variable "repo_name" {
  type = string
}

variable "repo_owner" {
  type = string
  default = "bcerney"
}
