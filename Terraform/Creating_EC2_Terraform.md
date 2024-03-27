# Creating an EC2 using Terraform

1. On local machine, set a persistent environment variable. This should be located in the .bash_profile file OR .bashrc or in some cases on mac .zshrc. If needed a file of this type can be manually created.
2. Set an environment variable inside that file using the 'export' command setting the value as the key required/associated with AWS account.
3. Ensure you restart the terminal after executing the 'source' command to set the variable. 
4. Once you have restarted the terminal you can use 'printenv' to check your variable has been set.
5. Create a new '.tr' file in VS code or similar. Here we outline and then create a script to run to create the EC2, see below:

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

6. To execute this, using the terminal cd to the correct 'terraform' folder. 
7. Run a 'terraform init' command to initialise
8. Then 'terraform plan' this will print your script for you to check and highlight any errors. If all is ready to run according to the terminal you can run it.
9. To run use 'terraform apply'
10. In order to terminate the instance use 'terraform destroy'