terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.82.2"
    }
  }
  required_version = ">= 1.10.0"
  backend "s3" {
    bucket         = "backendtfstate"
    region         = "ap-south-1"
    key            = "module_demo/terraform.tfstate"
    dynamodb_table = "backendtfstatelock"
    

  }
}