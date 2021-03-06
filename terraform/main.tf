provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_ex_role"
  role = aws_iam_role.lambda_ex_role.id
  policy = file("LambdaBasicExecutionRole.json")
}

resource "aws_iam_role" "lambda_ex_role" {
  assume_role_policy =  file("LambdaAssumeRole.json")
}



# docker and zip

#resource "aws_lambda_function" "MLOps" {
#  function_name = "MLOps"
#  handler = "lambda_function.handler"
#  role = "${aws_iam_role.lambda_ex_role.arn}"
#  runtime = "python3.8"
#  image_uri = ""
#}

# docker repo




resource "aws_lambda_function" "MLOps" {
  function_name = "MLOps"
  handler = "lambda_function.handler"
  role = "${aws_iam_role.lambda_ex_role.arn}"
  runtime = "python3.8"
  s3_bucket = "bclipp-mlops-demo"
  s3_key    = "models/1/lambda_deployment_function.zip"
}