# Create a security group & EC2 using that security group 

1. Above our EC2 configuring script we want to first create a security group using commands as seen below:
   
#Specify cloud platform and region
provider "aws" {
  region = "eu-west-1"
}

#Create a security group
resource "aws_security_group" "example_sg" {
  name        = "tech257-niamh-terraform-sg"
  description = "Security group for app"

  #Rule for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from all IP addresses
  }

  #Rule for port 3000 access
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }

  #Rule for port 80 access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }
}
2. Once this is written we can go on to add our EC2 script like earlier but with the addition of selecting a security group using the below:
   
   security_groups = [tech257-niamh-terraform-sg]

3. We also want to specify the ssh key to use, we can do so with this command:
   
   key_name = "tech257"

4. Once these have been added we can check for errors with 'teraform plan' in terminal and then run it with 'terraform apply'. If successful you should see: 
   ![alt text](<Screenshot 2024-03-27 at 16.15.00.png>)

# Full script together to run to create the security group and EC2 instance looks like this:

#Specify cloud platform and region
provider "aws" {
  region = "eu-west-1"
}

#Create a security group
resource "aws_security_group" "example_sg" {
  name        = "tech257-niamh-terraform-sg"
  description = "Security group for app"

  #Rule for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from all IP addresses
  }

  #Rule for port 3000 access
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }

  #Rule for port 80 access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from all IP addresses
  }
}

#create an EC2 instance
resource "aws_instance" "app_instance" {
  #Specify the AMI ID
  ami = "ami-02f0341ac93c96375"

  #Specify the instance type
  instance_type = "t2.micro"

  #Add a public IP to the instance
  associate_public_ip_address = true

  #Attach the security group to the instance
  security_groups = [tech257-niamh-terraform-sg]

  #Specify the SSH key pair name
  key_name = "tech257"

  #Name the instance
  tags = {
    Name = "Niamh-terraform-app"
  }
}

# We can see on the AWS console that it's been successful:

* The security group is visible:
   ![alt text](<Screenshot 2024-03-27 at 16.07.04.png>)

* The instance is visible and running:
   ![alt text](<Screenshot 2024-03-27 at 16.07.13.png>)

   