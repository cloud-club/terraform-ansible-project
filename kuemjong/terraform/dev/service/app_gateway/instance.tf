/*
    인스턴스 네이밍 규칙
    ec2_{app_name}
*/

resource "aws_instance" "ec2_app_gateway" {
  ami           = var.AMI_APP_GATEWAY
  instance_type = "t2.micro"

  # 서브넷 ID
  subnet_id = local.subnet_app_gateway.id

  # 배스천 호스트 접속용 키쌍
  # 배스천은 별도 인스턴스로 빼는걸 추천
  key_name = aws_key_pair.bastion_keypair.id

  # 보안 그룹
  security_groups = [aws_security_group.aws_sg_allow_http.id, aws_security_group.aws_sg_allow_tls.id, aws_security_group.aws_sg_allow_ssh_bastion.id]
}