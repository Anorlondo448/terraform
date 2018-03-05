###
#
# IAM for Lambda
#
# AssumeRoleをLambdaにしたIAMロール作成
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

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

data "aws_iam_policy_document" "lambda_submit" {
  statement {
    sid = "1"

    actions = [
      "batch:SubmitJob",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "lambda_submit" {
  name   = "lambda_submit"
  policy = "${data.aws_iam_policy_document.lambda_submit.json}"
}

resource "aws_iam_role_policy_attachment" "lambda_submit" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_submit.arn}"
}
