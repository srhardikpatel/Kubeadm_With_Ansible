resource "aws_security_group" "worker_node" {
  name          = var.worker_sg_name
  description   = "This is a sg created for Worker Node."
  vpc_id        = data.aws_vpc.existing_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" #all
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp" #all
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10256
    to_port     = 10256
    protocol    = "tcp" #all
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp" #all
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.worker_sg_name
  }
}
