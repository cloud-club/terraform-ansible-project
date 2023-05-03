/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정

  인스턴스 네이밍 규칙
  ec2_{app_name}
*/

resource "aws_instance" "ec2_service_2" {
  ami           = var.AMI_SERVICE_2
  instance_type = "t2.micro"

  # 서브넷 ID
  subnet_id = local.subnet_service_2.id

  # 보안 그룹
  security_groups = [aws_security_group.aws_sg_allow_http_from_app_gateway.id, aws_security_group.aws_sg_allow_tls_from_app_gateway.id]
}