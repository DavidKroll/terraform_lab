terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  #terraform tfstatefile remote backend section
  backend "s3" {
    bucket         = "dkroll-user2-jan7-terraform"
    key            = "dev/users2/terraform.tfstate"
    encrypt        = true
    region         = "us-west-1"
    dynamodb_table = "user2-dkroll-locking-table1"


  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1" #target region limit
}