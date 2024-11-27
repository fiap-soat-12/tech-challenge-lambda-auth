resource "aws_lambda_function" "my-lambda" {
  function_name = "my_lambda"
  role          = data.aws_iam_role.lab_role.arn
  handler       = "main"
  runtime       = "provided.al2"
  filename      = "./bin/bootstrap.zip"
}
