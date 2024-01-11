output "ami" {
  value       = aws_security_group.dk-res-sg-1.id
  description = "ID of the security group(s) that have been created"
}

output "created_instance" {
  value       = aws_instance.dk-res-ec2-1.id
  description = "ID of the created instance(s)"
}