###
#
# Elasticsearch
#
resource "aws_elasticsearch_domain" "cloudtrail" {
  domain_name           = "cloudtrail"
  elasticsearch_version = "6.2"

  cluster_config {
    instance_type = "t2.small.elasticsearch"
  }

  vpc_options {
    subnet_ids = [
      "${aws_subnet.private.id}",
    ]

    security_group_ids = [
      "${aws_security_group.elasticsearch.id}",
    ]
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:ap-northeast-1:${var.account-id}:domain/cloudtrail/*"
    }
  ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Domain = "cloudtrail"
  }
}
