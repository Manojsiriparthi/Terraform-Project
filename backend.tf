terraform {
  backend "s3" {
    bucket         = "manoj.terraform-project2024"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}
