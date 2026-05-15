resource "aws_subnet" "public_subnets" {

  count      = length(var.azs)
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.cidr_block, 4, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

