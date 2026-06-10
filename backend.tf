terraform {
  backend "s3" {
    bucket       = ""
    key          = ""
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
