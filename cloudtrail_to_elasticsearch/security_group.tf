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

  ingress {
    from_port = 500
    to_port   = 500
    protocol  = "udp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = 4500
    to_port   = 4500
    protocol  = "udp"

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

resource "aws_security_group" "elasticsearch" {
  name        = "elasticsearch"
  description = "elasticsearch security group"
  vpc_id      = "${aws_vpc.elasticsearch.id}"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    security_groups = [
      "${aws_security_group.bastion.id}",
      "${aws_security_group.lambda.id}",
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
    Name = "elasticsearch"
  }
}
