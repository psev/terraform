variable "region" {
  default = "us-west-2"
}

variable "deploy" {
  default = "web"
}

data "terraform_remote_state" "napalmbrain-io" {
  backend = "s3"

  config {
    bucket = "${var.identifior}-${var.region}-terraform-state"
    key = "zone/napalmbrain.io"
    region = "us-west-2"
  }
}
