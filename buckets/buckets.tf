resource "aws_s3_bucket" "terraform-state" {
  bucket = "${var.identifier}-${var.region}-${var.deploy}-state"
  region = "${var.region}"
  acl = "private"

  tags {
    Name = "${var.identifier}-${var.region}-${var.deploy}-state"
  }
}

resource "aws_s3_bucket" "archlinux-repository" {
  bucket = "${var.identifier}-${var.region}-${var.deploy}-archlinux-repository-public"
  region = "${var.region}"
  acl = "private"

  tags {
    Name = "${var.identifier}-${var.region}-${var.deploy}-archlinux-repository-public"
  }
}
