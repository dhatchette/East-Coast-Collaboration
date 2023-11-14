provider "aws" {
  region = "ap-southeast-4"


  skip_region_validation = true
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
