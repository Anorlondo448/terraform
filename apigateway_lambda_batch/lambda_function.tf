###
#
# Lambda Function
#
resource "aws_lambda_function" "mokumoku" {
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
