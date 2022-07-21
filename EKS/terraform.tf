provider "aws" {
  region = var.region[terraform.workspace]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-storage-playground"
    key    = "eks/terraform.tfstate"
    region = "eu-central-1"
  }
}