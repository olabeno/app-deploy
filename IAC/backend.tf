terraform {
  backend "s3" {
    bucket         = "iac-state-bucket001"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
