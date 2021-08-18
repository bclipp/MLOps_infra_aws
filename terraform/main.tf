provider "aws" {
  region = "us-east-1"
}

# docker and zip


# docker repo



resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_ex_role"
  role = aws_iam_role.lambda_ex_role.id
  policy = file("LambdaBasicExecutionRole.json")
}

resource "aws_iam_role" "lambda_ex_role" {
  assume_role_policy =  file("LambdaAssumeRole.json")
}

resource "aws_lambda_function" "MLOps" {
  function_name = "MLOps"
  handler = "lambda_function.handler"
  role = "${aws_iam_role.lambda_ex_role.arn}"
  runtime = "python3.8"
}