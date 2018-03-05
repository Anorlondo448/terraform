###
#
# IAM for Batch
#
# AssumeRoleをEC2にしたIAMロール作成
resource "aws_iam_role" "aws_batch_service_role" {
  name = "aws_batch_service_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "batch.amazonaws.com"
      }
    }
  ]
}
EOF
}

# 上記で定義したIAMポリシーに、AmazonEC2ContainerServiceforEC2Roleをアタッチ
resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
  role       = "${aws_iam_role.aws_batch_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}
