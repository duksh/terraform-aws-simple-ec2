#This block will output the Security Group ID
output "sg-id" {
  value       = aws_security_group.dk-res-sg-1.id
  description = "ID of the security group(s) that have been created"
}

# This block will output the EC2 instance ID
output "ec2-id" {
  value       = aws_instance.dk-res-ec2-1.id
  description = "ID of the EC2 instance(s) that have been created"
}
