###
#
# VPC
#
resource "aws_vpc" "batch" {
  cidr_block = "10.1.1.0/24"
}
