variable "api_name" {}
variable "api_stage_name" {}

variable "api_endpoints" {
  type        = any
  description = "API to Lambda mappings. (See examples.)"
}

variable "lambda_functions" {
  type        = any
  description = "Lambda functions. (See examples.)"
}
