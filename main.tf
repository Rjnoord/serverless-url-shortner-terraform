resource "aws_dynamodb_table" "url_table" {
  name         = "url-shortner"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "short_code"
  attribute {
    name = "short_code"
    type = "S"
  }
  tags = {
    environment = "dev"
    project     = "serverless-URL-Shortner"
  }
}

resource "aws_iam_role" "lamda_role" {
  name = "url-shortner-lamda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "lamda_basic" {
  role = aws_iam_role.lamda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"


}

resource "aws_lambda_function" "url-shortener" {
  function_name = "url-shortner"

  filename         = "lamda/function.zip"
  source_code_hash = filebase64sha256("lamda/function.zip")
  role             = aws_iam_role.lamda_role.arn
  handler          = "index.lambda_handler"
  runtime          = "python3.12"

  tags = {
    environment = "dev"
  }
}

resource "aws_apigatewayv2_api" "url_api" {
  name          = "url-shortner-api"
  protocol_type = "HTTP"


}

resource "aws_apigatewayv2_integration" "lamda_integration" {
  api_id = aws_apigatewayv2_api.url_api.id

  integration_type       = "AWS_PROXY"
  integration_uri        = "aws_lamda_function.url_shortner.invoke_arn"
  payload_format_version = "2.0"

}

resource "aws_apigatewayv2_route" "shorten_route" {
  api_id = aws_apigatewayv2_api.url_api.id

  route_key = "GET /"
  target    = "integration/${aws_apigatewayv2_integration.lamda_integration.id}"

}

resource "aws_apigatewayv2_stage" "dev" {
  api_id = aws_apigatewayv2_api.url_api.id

  name        = "$default"
  auto_deploy = true

}
resource "aws_lambda_permission" "api_gateway" {
  statement_id = "AllowAPIGatewayInvoke"

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.url-shortener.function_name

  principal = "apigateway.amazonaws.com"

}

