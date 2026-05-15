terraform {
  backend "s3" {
    bucket       = ""
    key          = ""
    region       = var.aws_provider_region
    encrypt      = true
    use_lockfile = true
  }
}
