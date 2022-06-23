resource "aws_s3_bucket" "terraform_state" {
  bucket = "afrantsuzau-terraform-playground"

  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "terraform_lock" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}