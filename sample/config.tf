###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform"
    key    = "sample/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
