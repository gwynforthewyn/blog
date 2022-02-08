terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }

  backend "s3" {
    bucket  = "playtechique-terraform-states"
    encrypt = true
    key     = "bloggo-not-doggo/"
    region  = "us-east-2"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"

}
