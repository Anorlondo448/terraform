###
#
# VPC
#
resource "aws_vpc" "elasticsearch" {
  cidr_block = "${var.cidr-vpc}"

  tags {
    Name = "elasticsearch"
  }
}
