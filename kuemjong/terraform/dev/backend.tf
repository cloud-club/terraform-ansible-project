terraform {
  backend "s3" {
    bucket = "terraform-state-backend"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
  }
}