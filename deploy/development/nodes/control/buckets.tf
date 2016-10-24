resource "aws_s3_bucket" "local" {
    bucket = "${var.identifier}-${var.region}-${var.deploy}-consul-backup"
    acl = "private"
}
