/*
  @floodnut 2023.04.22 최초 작성
  @floodnut 2023.04.22 수정

  변수 네이밍 규칙
  {CSP}_{variable_source}_{optional: usage}
*/

variable "AWS_REGION" {
  default = "ap-northeast-2" // 서울
}

variable "AWS_REGION_AZ" {
  default = "ap-northeast-2a"
}

variable "AWS_TERRAFORM_VERSION" {
  default = "1.4.0"
}