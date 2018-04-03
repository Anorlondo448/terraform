###
#
# CloudTrail
#
resource "aws_cloudtrail" "all-region" {
  name                          = "cloudtrail-all-region"
  s3_bucket_name                = "${aws_s3_bucket.log.id}"
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.cloudtrail.arn}"

  # AWSコンソールから実施するとIAMロールの紐付けと別に、独自のポリシー(oneClick_Cloudtrail...)の紐付けを要求される
  # 独自のポリシーの操作がterraformから難しいので、AWSコンソールから作成する
  # cloud_watch_logs_role_arn  = "${aws_iam_role.cloudtrail.arn}"
}
