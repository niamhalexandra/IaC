# Specify cloud platform and region
provider "aws" {
  region = "eu-west-1"
}

# Create a security group
resource "aws_security_group" "app_security_group" {
  name        = "tech257-niamh-terraform-sg"
  description = "Security group for app"

  # Rule for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from all IP addresses
  }

  # Rule for port 3000 access
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }

  # Rule for port 80 access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }
}

# Create an EC2 instance
resource "aws_instance" "app_instance" {
  # Specify the AMI ID
  
  ami = var.app_ami-id

  # Specify the instance type
  instance_type = var.instance_type

  # Add a public IP to the instance
  associate_public_ip_address = var.associate_public_ip

  # Attach the security group to the instance
  security_groups = [aws_security_group.app_security_group.name]

  # Specify the SSH key pair name
  key_name = "tech257"

  # Name the instance
  tags = {
    Name = var.instance_name
  }
}

# Create Repo 
provider "github" {
  token = var.github_token
}

resource "github_repository" "git_repo" {
  name = var.repo_name
  visibility = "public"
}

