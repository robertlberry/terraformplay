# The main resource definitions

# AWS VPC initiation
resource "aws_vpc" "vpc_with_igw" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "vpc-for-${local.env}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_with_igw.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az_public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_with_igw.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.az_private_subnet

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw_access" {
  vpc_id = aws_vpc.vpc_with_igw.id

  tags = {
    Name = "vpc-${local.env}-igw"
  }
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.vpc_with_igw.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_access.id
  }

  tags = {
    Name = "main-${local.env}-rt"
  }
}

resource "aws_route_table_association" "rta_example" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_rt.id
}
