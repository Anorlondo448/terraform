###
#
# API Gateway
#
resource "aws_api_gateway_rest_api" "mokumoku" {
  name        = "mokumoku"
  description = "this is api for mokumoku"
}

resource "aws_api_gateway_resource" "mokumoku" {
  rest_api_id = "${aws_api_gateway_rest_api.mokumoku.id}"
  parent_id   = "${aws_api_gateway_rest_api.mokumoku.root_resource_id}"
  path_part   = "mokumoku"
}
