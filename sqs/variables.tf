###
#
# Variables
#
###
# AWS Current Region
data "aws_region" "current" {}

# AWS Caller Identity
data "aws_caller_identity" "current" {}