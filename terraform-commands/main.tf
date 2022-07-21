# Provider source and latest version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"  # this ensures that only minor version is updated(.0 part) but not the major version(.20)
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  key_name      = "demo"    # write your pem file without .pem extension>
  tags = {
    "Name" = "tf-ec2"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "azat-tf-test-bucket-addwhateveryouwant"
}