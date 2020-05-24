output "state_bucket_name" {
  value = aws_s3_bucket.tfrmstate.id
}

output "dynamoDB_lock_table_name" {
  value = aws_dynamodb_table.terraform_statelock.id
}

output "backend_id" {
  value = random_string.tfstatename.result
}

