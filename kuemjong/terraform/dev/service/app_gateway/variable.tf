/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

locals {
  vpc_1 = module.vpc.vpc_1
}

locals {
  subnet_app_gateway = module.vpc.subnet_app_gateway
}

variable "APP_GATEWAY" {
  type    = string
  default = "app_gateway"
}