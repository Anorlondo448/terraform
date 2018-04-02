###
#
# Security Group
#
resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "bastion security group"
  vpc_id      = "${aws_vpc.elasticsearch.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags {
    Name = "bastion"
  }
}

resource "aws_security_group" "lambda" {
  name        = "lambda"
  description = "lambda security group"
  vpc_id      = "${aws_vpc.elasticsearch.id}"

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags {
    Name = "lambda"
  }
}