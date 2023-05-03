/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

resource "aws_key_pair" "bastion_keypair" {
  key_name   = "bastion_keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [public_key]
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "bastion_keypair"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "bastion_keypair.pub"
}