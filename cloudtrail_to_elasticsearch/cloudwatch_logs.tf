###
#
# CloudWatch Logs Group
#
resource "aws_cloudwatch_log_group" "cloudtrail" {
  name = "CloudTrail/SampleLogGroup"

  tags {
    Name = "CloudTrail/SampleLogGroup"
  }
}
