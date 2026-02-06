# Define default variables used for compute

variable "default_key_name" {
  description = "Default private key name."
  type        = string
}

variable "ami_type" {
  description = "Default AMI type used in this environment."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to be used."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet."
  type        = string
}

variable "public_subnet_sglist" {
  description = "Security groups that will be attached to the public instance."
  type        = list(string)
}

variable "private_subnet_sglist" {
  description = "Security groups that will be attached to the private instance."
  type        = list(string)
}
