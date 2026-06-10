data "aws_vpc" "existing_vpc" {
  tags = {
    Name = var.vpc_name
  }
}
