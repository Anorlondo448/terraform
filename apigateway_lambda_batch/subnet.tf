###
#
# Subnet
#
resource "aws_subnet" "batch" {
  vpc_id     = "${aws_vpc.batch.id}"
  cidr_block = "${cidrsubnet(aws_vpc.batch.cidr_block,8,1)}"

  tags {
    Name = "Batch"
  }
}
