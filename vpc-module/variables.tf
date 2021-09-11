variable "vpc-cidr-block" {
    default = "20.0.0.0/16"
}

variable "vpc-tag-name" {
    default = "devop-vpc3"
}

variable "az-suffix" {
  default = ["a","b","c"]
}

variable "region" {
  default = "us-west-2"
}