# list of terraform variables used by this module
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}


# variable for aws_instance type
variable "instance_type" {
  description = "Type of EC2 instance to run"
  default     = "t2.micro"
}

#variable for AMI   
variable "ami" {
  description = "The AMI used by the AWS Instance"
  default     = "ami-062a49a8152e4c031"
}