provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "dk-res-sg-1" {
  count       = var.instance_count
  name        = "dk-sg-${count.index}"
  description = "A simple security group from DK TerraMod"

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

  # Egress ruless
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dk-ec2" {
  count           = var.instance_count
  ami             = var.ami           # Replace with the default AMI ID for your region
  instance_type   = var.instance_type # Replace with your desired instance type
  security_groups = [aws_security_group.dk-res-sg-1[count.index].name]
  // Other configurations like key_name, tags, etc.
  tags = {
    Name         = "DK-EC2-${count.index}"
    BuiltBy      = "Packer"
    Env          = "SBX"
    Application  = "Packer"
    Owner        = "duksh.k@teamwork.net"
    Description  = "Testing Packer + Ansible"
    BusinessUnit = "TWMU"
    Schedule     = "24h_24h_7j_7j"

  }

}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 3
}