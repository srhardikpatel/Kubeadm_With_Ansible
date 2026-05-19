resource "aws_vpc" "main" {

  cidr_block           = var.cidr_block

  tags = {
    Name               = "example-vpc"
  }
  enable_dns_hostnames = true
}
