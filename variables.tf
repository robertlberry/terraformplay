variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "prod_cidr" {
  description = "The CIDR used for AWS production VPC."
  type        = string
}

variable "staging_cidr" {
  description = "The CIDR used for AWS staging VPC."
  type        = string
}

variable "dev_cidr" {
  description = "The CIDR used for AWS development VPC."
  type        = string
}

variable "home_ip" {
  description = "My home ip address."
  type        = string
}

variable "allowed_external_cidrs" {
  description = "External CIDRs allowed to ssh into the VPC."
  type        = list(string)
}

