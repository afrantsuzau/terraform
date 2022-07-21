variable "kubernetes_version" {
  default = "1.22"
}

variable "region" {
  default = {
    default    = "eu-central-1"
    sandbox    = "eu-central-1"
    staging    = "eu-central-1"
    testing    = "eu-central-1"
    production = "eu-west-1"
  }
}

variable "vpc_cidr" {
  default = {
    default    = "172.8.0.0/16"
    sandbox    = "172.16.0.0/16"
    staging    = "172.128.0.0/16"
    testing    = "172.132.0.0/16"
    production = "172.164.0.0/16"
  }
}