###
#
# Common
#
## 対象となるプロバイダ(AWS,GCP,etc)を指定します
provider "aws" {
  region = "ap-northeast-1"
}

## AWS上で使用するリージョンを指定します
variable "region" {
  type    = "string"
  default = "ap-northeast-1"
}
