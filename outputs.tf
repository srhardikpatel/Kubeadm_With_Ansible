output "ec2_instance_ip" {
  value = {
    for name, instance in aws_instance.ec2_instance : instance.tags["Name"] => instance.public_ip
  }
}
