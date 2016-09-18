variable "aws_key" {
  default = "AKIAJDFCAQTEKPKXI4HQ"
}

variable "aws_secret" {
  default = "JTKXhubvMzGZzlNTJpH4Rsoh9tzXFb5OzgsEvgJW"
}

provider "aws" {
  access_key = "${var.aws_key}"
  secret_key = "${var.aws_secret}"
  region = "${var.region}"
}
