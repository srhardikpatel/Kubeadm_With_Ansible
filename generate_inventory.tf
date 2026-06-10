locals {
  inventory = { for name, inst in aws_instance.ec2_instance : name => {
    public_ip = inst.public_ip
    user      = "ubuntu"
  }}
  
  master_hosts = { for name, inst in local.inventory : name => inst if can(regex("^master$", name)) }
  worker_hosts = { for name, inst in local.inventory : name => inst if can(regex("^worker$", name)) }
}

resource "local_sensitive_file" "ansible_inventory" {
  content           = templatefile("${path.module}/templates/inventory.tpl", {
#           ssh_key_path = var.key_pair_name
           master       = local.master_hosts
           worker       = local.worker_hosts
  })
  filename              = "${path.module}/inventories/dev/hosts.ini"
  file_permission       = "0644"
}
