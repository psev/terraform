variable "aws_key" {
  default = "AKIAIUPTPEKUHKFO3DNA"
}

variable "aws_secret" {
  default = "94j0bKlA0+2VCOZk8+jCaZORA6aCkaWXgjvohm4G"
}

provider "aws" {
  access_key = "${var.aws_key}"
  secret_key = "${var.aws_secret}"
  region = "${var.region}"
}
