output "state_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "state_bucket_region" {
  value = aws_s3_bucket.terraform_state.region
}

output "state_bucket_object_lock_enabled" {
  value = aws_s3_bucket.terraform_state.object_lock_enabled
}