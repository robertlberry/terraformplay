# Variable definitions for networking resources
variable "environment" {
  description = "Defined to receive the environment from root module."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block used by a newly defined VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block used by the public subnet in current VPC."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block used by the private subnet in current VPC."
  type        = string
}

variable "vpc_region" {
  description = "Default region for the vpc if not otherwise defined."
  type        = string
}

variable "az_public_subnet" {
  description = "Availability zone to be used by the public subnet."
  type        = number
}

variable "az_private_subnet" {
  description = "Availability zone to be used by the private subnet."
  type        = number
}

