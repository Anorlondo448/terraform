###
#
# Remote State
#

terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform"
    key    = "sqs/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_version = ">= 0.11.13"
}
