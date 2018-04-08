###
#
# IAM Role
#
resource "aws_iam_role" "cloudtrail" {
  name = "CloudTrail_CloudWatchLogs_Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudtrail" {
  role       = "${aws_iam_role.cloudtrail.name}"
  policy_arn = "${aws_iam_policy.cloudtrail.arn}"
}

resource "aws_iam_role" "lambda" {
  name = "lambda_elasticsearch_execution"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = "${aws_iam_role.lambda.name}"
  policy_arn = "${aws_iam_policy.lambda.arn}"
}
