variable "instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "m7i-flex.large"
}

variable "aws_provider_region" {
  description = "AWS Provider Region"
  type        = string
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Key Pair Name"
  type        = string
  default     = "eks-key"
}

variable "cidr_block" {
  description = "CIDR range for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "nodes_name" {
  description = "Nodes Name."
  type        = list(string)
  default     = ["Master", "Worker"]
}
