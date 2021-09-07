terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc-tag-name
  cidr = var.vpc-cidr-block
  azs             = ["us-west-2a", "us-west-2c"]
  public_subnets  = ["20.0.101.0/24", "20.0.102.0/24"]
  tags = {
    Terraform = "true"
    Environment = "dev"
    name = var.vpc-tag-name
  }
}