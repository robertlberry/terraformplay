# Setup VPC security groups
resource "aws_security_group" "ssh_sg" {
  name        = var.external_ssh_sg_name
  description = var.external_ssh_sg_desc
  vpc_id      = var.vpc_id

  ingress {
    description = var.external_ssh_sg_desc
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.external_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-allow-ingress"
  }
}

resource "aws_security_group" "internal_ssh_trust_mesh" {
  name        = "internal-ssh-trust-mesh"
  description = "Allows ssh traffic between internal members"
  vpc_id      = var.vpc_id
}

