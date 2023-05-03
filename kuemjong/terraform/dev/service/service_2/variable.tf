/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

locals {
  vpc_1 = module.vpc.vpc_1
}

locals {
  subnet_git_oauth = module.vpc.subnet_apps
}

variable "GIT_SERVICE_2" {
  type    = string
  default = "git_service_2"
}