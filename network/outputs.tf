# Outputs for network module
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc_with_igw.id
}

output "public_subnet_id" {
  description = "ID of public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}