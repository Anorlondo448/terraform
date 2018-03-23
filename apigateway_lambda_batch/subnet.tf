###
#
# Subnet
#
resource "aws_subnet" "batch-1a" {
  vpc_id     = "${aws_vpc.batch.id}"
  cidr_block = "${cidrsubnet(aws_vpc.batch.cidr_block,8,1)}"

  tags {
    Name = "Batch-1a"
  }
}

resource "aws_subnet" "batch-1c" {
  vpc_id     = "${aws_vpc.batch.id}"
  cidr_block = "${cidrsubnet(aws_vpc.batch.cidr_block,8,2)}"

  tags {
    Name = "Batch-1c"
  }
}

resource "aws_subnet" "batch-1d" {
  vpc_id     = "${aws_vpc.batch.id}"
  cidr_block = "${cidrsubnet(aws_vpc.batch.cidr_block,8,3)}"

  tags {
    Name = "Batch-1d"
  }
}
