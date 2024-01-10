provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "dk-res-sg-1" {
  count = var.instance_count

  name        = "dk-sg-${count.index}"
  description = "A simple security group from DK TerraMod"

  // Define your security group rules here
  
  # Ingress rules
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  # Egress rules
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dk-ec2" {
  count = var.instance_count
  
  ami           = "ami-062a49a8152e4c031" # Replace with the default AMI ID for your region
  instance_type = "t2.micro"     # Replace with your desired instance type

  security_groups = [aws_security_group.dk-res-sg-1[count.index].name]

  // Other configurations like key_name, tags, etc.

}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 3
}