resource "aws_instance" "nodes" {

  for_each                    = toset(var.azs)
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [
    aws_security_group.master_node.id,
    aws_security_group.worker_node.id
  ]
  subnet_id                   = aws_subnet.public_subnets["${each.value}"].id
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  count                       = length(var.nodes_name)
  tags                        = {
    Name                      = var.nodes_name[count.index]
  }
}

