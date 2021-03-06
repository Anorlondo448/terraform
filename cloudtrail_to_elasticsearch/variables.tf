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

## AWSアカウントID
variable "account-id" {
  type    = "string"
  default = "793428494912"
}

###
#
# Network
#
## vpc のCIDR
variable "cidr-vpc" {
  type    = "string"
  default = "10.2.0.0/16"
}

## public subnet のCIDR(bastion用)
variable "cidr-public-subnet" {
  type    = "string"
  default = "10.2.10.0/24"
}

## private subnet のCIDR(Elasticsearch,kibana,lambda用)
variable "cidr-private-subnet" {
  type    = "string"
  default = "10.2.20.0/24"
}

variable "cidr-private-subnet-1c" {
  type    = "string"
  default = "10.2.30.0/24"
}

## S3 bucket for cloudtrail log
variable "s3-bucket" {
  type    = "string"
  default = "cloudtrail-all-region-anorlondo"
}

###
#
# EC2
#
variable "instance-type" {
  type    = "string"
  default = "t2.micro"
}
