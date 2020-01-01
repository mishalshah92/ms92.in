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

  backend "s3" {
    region = "ap-south-1"
    bucket = "ms92-tf-states"
    dynamodb_table = "ms92-tf-states"
    encrypt = true
    key = "mishalshah92/ms92_in/"
  }
}
