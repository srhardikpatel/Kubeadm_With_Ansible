#To get the ami value of particular ami-id
#aws ec2 describe-images --image-ids ami-091138d0f0d41ff90 --query "Images[0].Name" --output text

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

