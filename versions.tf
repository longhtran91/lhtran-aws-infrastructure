terraform {
  required_version = ">= 1.3"
  cloud {
    organization = "lhtran"

    workspaces {
      name = "lhtran-aws-infrastructure"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.3"
    }
  }
}