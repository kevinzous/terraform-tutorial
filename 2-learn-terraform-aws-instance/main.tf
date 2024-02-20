# Terraform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  ## OPTION 1: local backend state

  ## OPTION 2: aws s3 bucket
  # backend "s3" {
  #   bucket = "backend-bucket-test-kz"
  #   key    = "terraform.tfstate"
  #   region = "us-west-2"
  # }
  
  ## OPTION 3: tf cloud remote state
  # and set up following: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-remote
    cloud {
    organization = "dizzy_world"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

  required_version = ">= 1.2.0"
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
    Name = var.instance_name
  }
}
