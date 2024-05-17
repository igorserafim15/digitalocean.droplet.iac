terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }

  backend "s3" {
    bucket  = "rocketseat-state-bucket-s3-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "igorserafim123-sso"
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "aws" {
  profile = "igorserafim123-sso"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.state_bucket}-${terraform.workspace}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.terraform_state
  ]
}
