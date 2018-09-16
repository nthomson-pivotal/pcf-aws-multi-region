provider "aws" {
  region = "us-east-1"

  version = "~> 1.33"
}

data "aws_caller_identity" "account" {}