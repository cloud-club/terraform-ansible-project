/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

resource "aws_internet_gateway" "internet_gateway_service" {
  vpc_id = aws_vpc.vpc_init_cloud_1.id

  tags = {
    Name = "main"
  }
}

resource "aws_vpc" "vpc_1" {

  # 기본값 = true
  #enable_dns_hostnames = "true"

  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "vpc_1"
  }
}


# Subnets
resource "aws_subnet" "subnet_app_gateway" {
  vpc_id            = aws_vpc.vpc_1.id
  availability_zone = var.aws_az

  cidr_block              = "10.10.0.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet_app_gateway"
  }
}

resource "aws_subnet" "subnet_apps" {
  vpc_id            = aws_vpc.vpc_1.id
  availability_zone = var.aws_az

  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet_apps"
  }
}

# Route Tables
resource "aws_route_table" "route_table_subnet_app_gateway" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "route_table_subnet_app_gateway"
  }
}

resource "aws_route_table_association" "route_table_association_subnet_app_gateway" {
  subnet_id      = aws_subnet.subnet_app_gateway.id
  route_table_id = aws_route_table.route_table_subnet_app_gateway.id
}
