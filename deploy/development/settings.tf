variable "deploy" {
  default = "alpha"
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "deepfield-global-terraform-state"
    key = "deploy/development/network"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "public" {
  backend = "s3"

  config {
    bucket = "deepfield-global-terraform-state"
    key = "deploy/public"
    region = "us-west-2"
  }
}
