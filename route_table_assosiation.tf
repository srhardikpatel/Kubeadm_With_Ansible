resource "aws_route_table_association" "association" {
  count          = var.azs_count
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.route_table.id
}

