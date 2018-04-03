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
      "arn:aws:logs:ap-northeast-1:${var.account-id}:log-group:CloudTrail/DefaultLogGroup:log-stream:${var.account-id}_CloudTrail_ap-northeast-1*",
    ]
  }

  statement {
    sid    = "AWSCloudTrailPutLogEvents20141101"
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:ap-northeast-1:${var.account-id}:log-group:CloudTrail/DefaultLogGroup:log-stream:${var.account-id}_CloudTrail_ap-northeast-1*",
    ]
  }
}

resource "aws_iam_policy" "cloudtrail" {
  name   = "cloudtrail"
  policy = "${data.aws_iam_policy_document.cloudtrail.json}"
}
