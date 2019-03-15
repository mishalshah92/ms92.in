provider "aws" {
  region  = "${var.aws_region}"
  profile = "ms92"
}

variable "aws_region" {
  type    = "string"
  default = "ap-south-1"
}

terraform {
  required_version = "> 0.11.2"
}

variable "owner" {
  type    = "string"
  default = "mishalshah92"
}
