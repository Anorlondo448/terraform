###
#
# Batch Job Queue
#
resource "aws_batch_job_queue" "mokumoku" {
  name     = "batch-job-queue"
  state    = "ENABLED"
  priority = 1

  compute_environments = [
    "${aws_batch_compute_environment.batch.arn}",
  ]
}
