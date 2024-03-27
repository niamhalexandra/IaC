<<<<<<< HEAD
# Specify cloud platform and region
provider "aws" {
  region = "eu-west-1"
}

# Create a security group
resource "aws_security_group" "example_sg" {
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
  ami = "ami-02f0341ac93c96375"

  # Specify the instance type
  instance_type = "t2.micro"

  # Add a public IP to the instance
  associate_public_ip_address = true

  # Attach the security group to the instance
  security_groups = [tech257-niamh-terraform-sg]

  # Specify the SSH key pair name
  key_name = "tech257"

  # Name the instance
  tags = {
    Name = "Niamh-terraform-app"
  }
}
=======
# Create an ec2 instance

# where to create - provide cloud name
provider "aws"{
# which region to use to create a resource/service
    region = "eu-west-1"
# terraform will download all the required dependencies/plugins
# terraform init command
}

# Which service/resource
resource "aws_instance" "app_instance" {

# which ami ID
    ami = "ami-02f0341ac93c96375"

# what type of instance to launch
    instance_type = "t2.micro"

# please add a public ip to this instance
    associate_public_ip_address = true

# name the service
    tags = {
        name = "Niamh-terraform-app"
    }

}

# syntax of hashi corp language is name {key = value}
>>>>>>> refs/remotes/origin/main
