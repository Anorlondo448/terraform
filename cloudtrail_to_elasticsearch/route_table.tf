###
#
# Route Table
#
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.elasticsearch.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.elasticsearch.id}"
  }
}

###
#
# Route Table Assosiation
#
resource "aws_route_table_association" "main" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.main.id}"
}
