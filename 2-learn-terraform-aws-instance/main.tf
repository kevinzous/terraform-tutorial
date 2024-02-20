# Terraform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "backend-bucket-test-kz"
    key    = "terraform.tfstate"
    region = "us-west-2"
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

# use a backend bucket to store tfstate
resource "aws_s3_bucket" "backend_bucket" {
  bucket = "backend-bucket-test-kz"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  force_destroy= true
}
