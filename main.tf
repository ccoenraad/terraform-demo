terraform {
  backend "s3" {
    bucket = "carel-terraform-demo-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }

  // https://registry.terraform.io/providers/hashicorp/aws/latest/docs
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

module "test_bucket" {
  source = "./modules/aws-s3-bucket"
  bucket_name = "carel-terraform-demo-test"
}


module "staging_bucket" {
  source = "./modules/aws-s3-bucket"
  bucket_name = "carel-terraform-demo-staging"
}
