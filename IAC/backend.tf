terraform {
  backend "s3" {
    bucket         = "iac-state-bucket001"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "your-dynamodb-table"
    # encrypt        = true
  }
}