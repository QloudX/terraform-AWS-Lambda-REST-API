locals {
  openAPI_spec = {
    for endpoint, spec in var.api_endpoints : endpoint => {
      for method, lambda in spec : method => {
        x-amazon-apigateway-integration = {
          type       = "aws_proxy"
          httpMethod = "POST"
          uri        = "arn:aws:apigateway:${data.aws_region.region.name}:lambda:path/2015-03-31/functions/arn:aws:lambda:${data.aws_region.region.name}:${data.aws_caller_identity.identity.account_id}:function:${lambda}/invocations"
        }
      }
    }
  }
}

resource "aws_api_gateway_rest_api" "rest_api" {
  name = var.api_name
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  body = jsonencode({
    openapi = "3.0.1"
    paths   = local.openAPI_spec
  })
}
