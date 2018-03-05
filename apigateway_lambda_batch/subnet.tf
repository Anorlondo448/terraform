###
#
# Subnet
#
resource "aws_subnet" "batch" {
  vpc_id     = "${aws_vpc.batch.id}"
  cidr_block = "10.1.1.0/24"
}
