/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정
*/

module "service_app_gateway" {
  source = "./service/app_gateway"

}

module "service_1" {
  source = "./service/service_1"
}

module "service_2" {
  source = "./service/service_2"

}
