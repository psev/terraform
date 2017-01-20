resource "aws_s3_bucket" "consul-backup" {
  bucket = "${var.identifier}-${var.region}-${var.deploy}-consul-backup"
  acl = "private"
  region = "${var.region}"

  tags {
    Name = "${var.identifier}-${var.region}-${var.deploy}-consul-backup"
  }
}

resource "aws_s3_bucket" "archlinux-repository" {
  bucket = "${var.identifier}-${var.region}-${var.deploy}-archlinux-repository"
  acl = "private"
  region = "${var.region}"

  tags {
    Name = "${var.identifier}-${var.region}-${var.deploy}-archlinux-repository"
  }
}

resource "aws_s3_bucket" "docker-registry" {
  bucket = "${var.identifier}-${var.region}-${var.deploy}-docker-registry"
  acl = "private"
  region = "${var.region}"

  tags {
    Name = "${var.identifier}-${var.region}-${var.deploy}-docker-registry"
  }
}
