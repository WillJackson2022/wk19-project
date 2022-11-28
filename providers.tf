terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.21.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }
}
 
  provider "aws" {
    region  = "us-east-1"
    profile = "default"
}