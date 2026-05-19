resource "aws_subnet" "public_subnets" {

  for_each            = toset(var.azs)
  vpc_id              = aws_vpc.main.id
  availability_zone   = each.value

  cidr_block          = cidrsubnet(var.cidr_block, 4, index(var.azs, each.value))

  tags                = {
    Name              = "Public Subnet-${each.value}"
  }
}
