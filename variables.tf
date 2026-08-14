variable "aws_provider_region" {
  description = "AWS Provider Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
  default     = "example-vpc"
}

variable "iam_instance_profile_name" {
  description = "Instance Profile Name"
  type        = string
  default     = "example-instance-profile"
}

variable "ec2_instance_name" {
  description = "The EC2 instance's name."
  type        = string
  default     = "Jenkins-with-Terraform"
}

variable "ec2_instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "m7i-flex.large"
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 30
}

variable "volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "key_pair_name" {
  description = "Key Pair Name"
  type        = string
  default     = "terra-key"
}

variable "master_sg_name" {
  description = "Master node security group Name"
  type        = string
  default     = "Master-Node-SG"
}

variable "worker_sg_name" {
  description = "Worker node security group Name"
  type        = string
  default     = "Worker-Node-SG"
}
