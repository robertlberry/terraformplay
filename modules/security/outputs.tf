output "allow_external_ssh_sg_id" {
  description = "The ID of the security group that allows ssh from external CIDRs."
  value       = aws_security_group.ssh_sg.id
}

output "internal_ssh_trust_mesh_id" {
  description = "The ID of the security group that allows internal ssh connections."
  value       = aws_security_group.internal_ssh_trust_mesh.id
}