variable "vpc_id" {
  description = "VPC ID created in network module."
  type        = string
}

variable "external_cidrs" {
  description = "List of external CIDRs"
  type        = list(string)
}
#variable "sg_creation" {
#    description = "Security groups to create."
#    type = map()
#}

# This section defines the only security group with ingress and egress rules
variable "external_ssh_sg_name" {
  description = "The name of the security group."
  type        = string
  default     = "allow-external-ssh-ingress"
}

variable "external_ssh_sg_desc" {
  description = "The description of the security group."
  type        = string
  default     = "Allows external ssh connections from defined CIDRs"
}

# This section is for setting up trust mesh security groups.
# We define these for each internal trust mesh security group.
## Allow internal ssh
variable "internal_ssh_trust_mesh_name" {
  description = "The name of the security group."
  type        = string
  default     = "internal-ssh-trust-mesh"
}

variable "internal_ssh_trust_mesh_desc" {
  description = "The description of the security group."
  type        = string
  default     = "Allows ssh traffic between internal members"
}