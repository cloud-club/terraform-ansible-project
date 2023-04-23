#############개요############## 
# AZ - 2개 (a, c) 
# VPC - 1개
# Public Subnet - 2개 (a - 1 , c - 1)
# Private Subnet - 2개 (a - 1 , c - 1)
# Route Table - 4개 (public - 2, private - 2)
# IGW - 1개
# EC2 - 5개 (public[a] - 1, private[a] - 3, private[c] - 1)
# ALB - 1개 (Target Group - [private a~1, private c~1] )
# SG가 빡세겠구먼..
############################# 


provider "aws" {
  region = "ap-northeast-2"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "project_vpc"
  }
}

# Public Subnet
resource "aws_subnet" "subnet_public_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project_subnet_public_1"
  }
}
resource "aws_subnet" "subnet_public_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project_subnet_public_2"
  }
}

# Private Subnet
resource "aws_subnet" "subnet_private_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project_subnet_private_1"
  }
}
resource "aws_subnet" "subnet_private_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project_subnet_private_2"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "project_igw"
  }
}

# Route Table for public subnet
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "project_route_table_public"
  }
}

# Route Table for private subnet
resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "project_route_table_public"
  }
}

# Route Table association for public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.route_table_public.id
}

# Route Table association for private subnet
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.route_table_private.id
}