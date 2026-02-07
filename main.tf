# The main resource definitions

# Set backend
terraform {
  cloud {
    organization = "rlbenterprises"
    workspaces {
      name = "CLI-AWS-DEV"
    }
  }

  required_version = ">= 1.1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Set provders
provider "aws" {
  region = var.active_region
}

# AWS VPC initiation
module "networking_setup" {
  source = "./modules/network"

  # Definitions
  environment         = var.environment
  vpc_region          = "us-east-1"
  vpc_cidr_block      = var.vpc_cidr
  public_subnet_cidr  = "10.10.1.0/24"
  private_subnet_cidr = "10.10.2.0/24"
  az_public_subnet    = local.public_subnet_az
  az_private_subnet   = local.private_subnet_az
}

# AWS Security initiation
module "security_setup" {
  source = "./modules/security"

  # Definitions
  vpc_id         = module.networking_setup.vpc_id
  external_cidrs = var.allowed_external_cidrs
  # stick with defaults defined in security module
}

# AWS Compute initiation
module "compute_setup" {
  source = "./modules/compute"

  # Definitions of 2 ec2 instances.
  # One in the public subnet
  # One in the private subnet
  ami_type              = local.ami_name
  instance_type         = local.default_ec2_type
  default_key_name      = local.default_pki_key
  public_subnet_id      = module.networking_setup.public_subnet_id
  private_subnet_id     = module.networking_setup.private_subnet_id
  public_subnet_sglist  = [module.security_setup.allow_external_ssh_sg_id, module.security_setup.internal_ssh_trust_mesh_id]
  private_subnet_sglist = [module.security_setup.internal_ssh_trust_mesh_id]
}

