###
#
# SQS
#

resource "aws_sqs_queue" "sample_standard" {
  name = "sample_standard_queue"
}
