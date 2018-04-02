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
}
