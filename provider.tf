terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }

  backend "s3" {
    bucket = "tf-tuts-state1"
    key    = "mumbai"
    region = "ap-south-1"
  }
}

