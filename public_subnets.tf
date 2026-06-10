data "aws_subnets" "public_subnets" {
   filter {
     name   = "vpc-id"
     values = [data.aws_vpc.existing_vpc.id]
   }

   filter {
     name   = "tag:Name"
     values = ["Public*"]
   }
}
