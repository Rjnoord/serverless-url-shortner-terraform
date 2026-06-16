data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lamda/lamda_function.py"
  output_path = "${path.module}/lamda/lambda_function.zip"
}