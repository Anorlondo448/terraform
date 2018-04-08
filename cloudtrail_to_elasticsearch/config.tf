###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform"
    key    = "cloudtrail_to_elasticsearch/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
