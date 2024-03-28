# How to create a repo with Terraform

1. First we need to set up a token that provides access for Terraform to specific Github. On Github go to Settings > Developer Settings > Personal acceess tokens > Tokens (classic) > Generate
2. Then go into the Terraform script and write commands to create a repo (as below):
   #Create Repo 
provider "github" {
  token = var.github_token
}

resource "github_repository" "git_repo" {
  name = var.repo_name
  visibility = "public"
}

3. Assign the variables in the variables.tf file (as below):
   #Create variable
   variable "github_token" {
    default = "your token would go here"
}

variable "repo_name" {
    default = "tech257-terraform-multi-provider"
}

4. Use 'terraform plan' to ensure no errors
5. Use 'terraform apply' to execute