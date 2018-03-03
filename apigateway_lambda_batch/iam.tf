###
#
# IAM for ECS
#
# AssumeRoleをEC2にしたIAMロール作成
resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    "Aciton": "sts:AssumeRole",
    "Effect": "Allow",
    "Principal": {
      "Service": "ec2.amazonaws.com"
    }
  ]
}
EOF
}

# 上記で定義したIAMポリシーに、AmazonEC2ContainerServiceforEC2Roleをアタッチ
resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = "${aws_iam_role.ecs_instance_role.name}"
  policy_arn = "arn:aws:iam:aws:policy/serivce-role/AmazonEC2ContainerServiceforEC2Role"
}

# IAMロールからインスタンスプロファイル作成
resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = "ecs_instance_role"
  role = "${aws_iam_role.ecs_instance_role.name}"
}
