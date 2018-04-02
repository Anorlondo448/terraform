###
#
# VPC
#
resource "aws_vpc" "elasticsearch" {
  cidr_block = "10.2.0.0/16"

  tags {
    Name = "elasticsearch"
  }
}
