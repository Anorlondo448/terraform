###
#
# Subnet
#
resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.elasticsearch.id}"
  cidr_block        = "${var.cidr-public-subnet}"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.elasticsearch.id}"
  cidr_block        = "${var.cidr-private-subnet}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name = "private-subnet-1d"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = "${aws_vpc.elasticsearch.id}"
  cidr_block        = "${var.cidr-private-subnet-1c}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "private-subnet-1c"
  }
}
