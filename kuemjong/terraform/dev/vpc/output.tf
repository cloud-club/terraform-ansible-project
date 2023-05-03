/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

output "vpc_init_cloud_1" {
  value = aws_vpc.vpc_1
}

output "subnet_app_gateway" {
  value = aws_subnet.subnet_app_gateway
}

output "subnet_apps" {
  value = aws_subnet.subnet_apps
}