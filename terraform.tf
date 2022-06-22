terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  alias  = "frankfurt"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "irland"
}