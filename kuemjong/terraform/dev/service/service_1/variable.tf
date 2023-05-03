/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

locals {
  vpc_1 = module.vpc.vpc_1
}

locals {
  subnet_rocket = module.vpc.subnet_apps
}

variable "SERVICE_1" {
  type    = string
  default = "service_1"
}