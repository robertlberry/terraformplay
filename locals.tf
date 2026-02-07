# Root module locals
# Amazon Linux latest AMI
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "aws_availability_zones" "available_azs" {
  state = "available"
}

# Pick a couple of AZs that are available
resource "random_shuffle" "azs" {
  input        = data.aws_availability_zones.available_azs.names
  result_count = 2

  keepers = {
    environment = var.environment
  }
}

locals {
  # AMI used for compute
  ami_name         = data.aws_ssm_parameter.al2023_ami.name
  default_ec2_type = "t3.micro"
  default_pki_key  = "rlb-default-aws"

  public_subnet_az  = random_shuffle.azs.result[0]
  private_subnet_az = random_shuffle.azs.result[1]
}