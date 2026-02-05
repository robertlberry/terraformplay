# Setting up compute resources


resource "aws_instance" "ec2_public_subnet" {
  ami                         = var.ami_type
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = var.public_subnet_sglist
  key_name                    = var.default_key_name
  associate_public_ip_address = true

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "ec2_private_subnet" {
  ami                    = var.ami_type
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = var.private_subnet_sglist
  key_name               = var.default_key_name

  tags = {
    Name = "private-instance"
  }
}
