

variable "instance-type" {
  type    = string
  default = "t2.medium"
}

variable "availability-zone" {
  type = string
}

variable "key-name" {
  type    = string
  default = "train-oregon-kp"
}

variable "environment" {
  type    = string
  default = "kafka"
}

variable "role" {
  type = string
}

variable "purpose" {
  type = string
}

variable "inboundport" {
  type = string
}


variable "machine-ami" {
  type = string
}

variable "az-suffix" {
  default = ["a","b","c"]
}

variable "region" {
  default = "us-west-2"
}

variable "az-suffix-2" {
  type = map
  default = {
    "us-west-2a" = 0
    "us-west-2b" = 1
    "us-west-2c" = 2
      }
}

variable "subnet-suffix" {
type = string
}


