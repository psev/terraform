variable "region" {
  default = "us-east-1"
}

variable "deploy" {
  default = "alpha"
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "${var.identifier}-us-east-1-terraform-state"
    key = "deploy/alpha/network"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sugarush-io" {
  backend = "s3"

  config {
    bucket = "${var.identifier}-us-east-1-terraform-state"
    key = "zone/sugarush.io"
    region = "us-east-1"
  }
}
