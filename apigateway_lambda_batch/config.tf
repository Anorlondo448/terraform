###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform"
    key    = "apigateway_lambda_batch/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
