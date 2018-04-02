###
#
# Internet Gateway
#
resource "aws_internet_gateway" "elasticsearch" {
  vpc_id = "${aws_vpc.elasticsearch.id}"

  tags {
    Name = "elasticsearch"
  }
}
