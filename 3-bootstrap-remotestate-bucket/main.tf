# Terraform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

# provider = plugin that Terraform uses to create and manage your resources.
provider "aws" {
  region = "us-west-2"
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
