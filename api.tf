resource "aws_api_gateway_rest_api" "rest_api" {
  name = var.api_name
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
