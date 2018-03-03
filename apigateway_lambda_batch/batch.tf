###
#
# Batch Job Definition
#
resource "aws_batch_job_definition" "test" {
  name = "batch_job_definition"
  type = "container"

  container_properties = <<EOP
{
  "command": ["echo", "YOU DIED"],
  "image": "busybox",
  "memory": 1024,
  "vcpus": 1,
  "volumes": [
    {
      "host": {
        "sourcePath": "/tmp"
      },
      "name": "tmp"
    }
  ],
  "environment": [
    {
      "name": "VARNAME",
      "value": "VARVAL"
    }
  ],
  "mountPoints": [
    {
      "sourceVolume": "tmp",
      "containerPath": "/tmp",
      "readOnly": false
    }
  ],
  "ulimits": [
    {
      "hardLimit": 1024,
      "name": "nofile",
      "softLimit": 1024
    }
  ]
}
EOP
}
