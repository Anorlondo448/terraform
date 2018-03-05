###
#
# VPC
#
resource "aws_vpc" "batch" {
  cidr_block = "10.1.0.0/16"
}
