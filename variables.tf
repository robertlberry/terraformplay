variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  description = "The CIDR used for AWS development VPC."
  type        = string
}

variable "allowed_external_cidrs" {
  description = "External CIDRs allowed to ssh into the VPC."
  type        = list(string)
}

variable "active_region" {
  description = "Default region to use for AWS account."
  type        = string
}

