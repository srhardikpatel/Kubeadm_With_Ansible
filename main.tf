locals {
  sg_config = {
    "master" = {
       name     = "Master"
       node_id  = aws_security_group.master_node.id
    }
    "worker" = {
       name     = "Worker"
       node_id  = aws_security_group.worker_node.id
    }
  }
}

resource "aws_instance" "ec2_instance" {

  for_each                    = local.sg_config
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = [each.value.node_id]
  subnet_id                   = data.aws_subnets.public_subnets.ids[0]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags                        = {
    Name                      = each.value.name
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  iam_instance_profile = var.iam_instance_profile_name
}
