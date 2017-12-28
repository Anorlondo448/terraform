###
#
# Common
#

## 対象となるプロバイダ(AWS,GCP,etc)を指定します
provider "aws" {
  region = "ap-northeast-1"
}

## 識別子としてアプリ名を指定します
variable "app-name" {
  type    = "string"
  default = "sample"
}

## 識別子として環境を指定します
variable "env-short" {
  type    = "string"
  default = "stg"
}

## AWS上で使用するリージョンを指定します
variable "region" {
  type    = "string"
  default = "ap-northeast-1"
}

###
#
# VPC
#

## VPCのCIDRを指定します
variable "vpc-cidr" {
  type    = "string"
  default = "10.1.0.0/16"
}

## アベイラビリティゾーン1aに配置するPrivate SubnetのCIDRを指定します
variable "1a-private-cidr" {
  type    = "string"
  default = "10.1.1.0/24"
}

## アベイラビリティゾーン1cに配置するPrivate SubnetのCIDRを指定します
variable "1c-private-cidr" {
  type    = "string"
  default = "10.1.2.0/24"
}

## アベイラビリティゾーン1aに配置するPublic SubnetのCIDRを指定します
variable "1a-public-cidr" {
  type    = "string"
  default = "10.1.3.0/24"
}

## アベイラビリティゾーン1cに配置するPublic SubnetのCIDRを指定します
variable "1c-public-cidr" {
  type    = "string"
  default = "10.1.4.0/24"
}

###
#
# bastionサーバ(EC2)
#

## bastionサーバ(EC2)を起動する時に使用するAMIのIDのを指定します
variable "bastion-ami-id" {
  type    = "string"
  default = "ami-da9e2cbc"
}

## bastionサーバ(EC2)を起動する時に指定するインスタンスのタイプを指定します
variable "bastion-instance-type" {
  type    = "string"
  default = "t2.nano"
}

# bastionサーバ(EC2)にSSH接続するためのキーペアのファイルを指定します
# このファイルはssh-keygenコマンドなどでローカルに作成しておく必要があります
variable "bastion-public-key-path" {
  type    = "string"
  default = "key/bastion.pub"
}

###
#
# Appサーバ(EC2)
#

## Appサーバ(EC2)を起動する時に使用するAMIのIDのを指定します
variable "app-ami-id" {
  type    = "string"
  default = "ami-da9e2cbc"
}

## Appサーバ(EC2)を起動する時に指定するインスタンスのタイプを指定します
variable "app-instance-type" {
  type    = "string"
  default = "t2.nano"
}

# Appサーバ(EC2)にSSH接続するためのキーペアのファイルを指定します
# このファイルはssh-keygenコマンドなどでローカルに作成しておく必要があります
variable "app-public-key-path" {
  type    = "string"
  default = "key/app.pub"
}
