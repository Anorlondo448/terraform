###
#
# Batch Compute Environment
#
resource "aws_batch_compute_environment" "batch" {
  compute_environment_name = "batch"

  compute_resources {
    instance_role = "${aws_iam_instance_profile.ecs_instance_role.arn}"

    instance_type = [
      "optimal",
    ]

    max_vcpus     = 16
    min_vcpus     = 0
    desired_vcpus = 2

    security_group_ids = [
      "${aws_security_group.batch.id}",
    ]

    subnets = [
      "${aws_subnet.batch-1a.id}",
      "${aws_subnet.batch-1c.id}",
      "${aws_subnet.batch-1d.id}",
    ]

    type = "EC2"
  }

  service_role = "${aws_iam_role.aws_batch_service_role.arn}"
  type         = "MANAGED"

  depends_on = [
    "aws_iam_role_policy_attachment.aws_batch_service_role",
  ]
}
