# define the provider
provider "aws" {
  version = "~> 2.23"
  region  = "us-east-1"
}

# generate random string to be used as part of s3 and dynamoDB table name
resource "random_string" "tfstatename" {
  length  = 6
  special = false
  upper   = false
}
