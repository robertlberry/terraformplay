# The block below configures Terraform to use the 'remote' backend with HCP Terraform.
terraform {
  cloud {
    organization = "rlbenterprises"
    workspaces {
      name = "CLI-AWS-DEV"
    }
  }

  required_version = ">= 1.1.2"
}