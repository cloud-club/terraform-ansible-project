/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-backend"

  tags = {
    Name = "Terraform state"
  }
}

