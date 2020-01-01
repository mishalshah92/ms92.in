provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

terraform {
  required_version = "> 0.12"
}
