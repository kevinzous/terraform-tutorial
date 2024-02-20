# Terraform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

}


# provider = plugin that Terraform uses to create and manage your resources.
provider "aws" {
  region = "us-west-2"
}

# define components of your infrastructure
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a" # Amazon Machine Images is a supported and maintained image provided by AWS
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
