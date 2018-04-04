###
#
# IAM Policy
#
data "aws_iam_policy_document" "cloudtrail" {
  statement {
    sid    = "AWSCloudTrailCreateLogStream20141101"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}",
    ]
  }

  statement {
    sid    = "AWSCloudTrailPutLogEvents20141101"
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}",
    ]
  }
}

resource "aws_iam_policy" "cloudtrail" {
  name   = "cloudtrail"
  policy = "${data.aws_iam_policy_document.cloudtrail.json}"
}
