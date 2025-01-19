terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket = "backendtfstate"
    region = "us-east-1"
    key = "backendtest/terraform.tfstate"
    dynamodb_table = "backendtfstatelock"
    
  }
}
# Configure the AWS Provide
provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "base" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "hello-tf"
  }

}
