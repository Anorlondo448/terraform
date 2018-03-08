###
#
# Lambda Function
#
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.arn}"
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.region}:${var.accountId}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_lambda_function" "lambda" {
  filename         = "lambda_function_payload.zip"
  function_name    = "lambda_function_name"
  role             = "${aws_iam_role.lambda_role.arn}"
  handler          = "lambda_function_payload.lambda_handler"
  source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  runtime          = "python3.6"

  environment {
    variables = {
      foo = "baa"
    }
  }
}
