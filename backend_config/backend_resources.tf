# create s3 bucket to store terraform-state file
resource "aws_s3_bucket" "tfrmstate" {
  bucket        = "app-tfstate-${random_string.tfstatename.result}"
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "TF remote state"
  }
}

# create dynamodb table to store state of terraform-state-lock file
resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "APP-locktable-${random_string.tfstatename.result}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
