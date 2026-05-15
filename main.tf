data "aws_caller_identity" "current" {}

locals {
  aws_account_id  = "${data.aws_caller_identity.current.account_id}"
  sensitive       = true
  ephemeral       = true
}

resource "aws_s3_bucket" "terraform-state" {
  bucket       = "${local.aws_account_id}-terraform-states"

  force_destroy = true # Allows deletion of all objects upon bucket destruction
}

# Bucket encryption to hide sensitive state data
resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.terraform-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform-state.id

  versioning_configuration {
    status = "Enabled"
  }
}
