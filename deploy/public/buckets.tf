resource "aws_s3_bucket" "terraform-state" {
  bucket = "${var.identifier}-${var.deploy}-terraform-state"
  acl = "private"
  region = "us-west-2"

  tags {
    Name = "${var.identifier}-${var.deploy}-terraform-state"
  }
}
