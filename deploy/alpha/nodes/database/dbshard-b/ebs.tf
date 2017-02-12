resource "aws_ebs_volume" "sdb" {
  availability_zone = "${var.region}${element(split(",", data.terraform_remote_state.network.subnets), count.index)}"
  type = "gp2"
  size = "1"

  count = "${var.nodes}"

  tags {
    Name = "${var.role}-${var.deploy}"
    Managed = "terraform-${var.deploy}"
  }
}

resource "aws_volume_attachment" "sdb" {
  device_name = "/dev/sdb"
  volume_id = "${element(aws_ebs_volume.sdb.*.id, count.index)}"
  instance_id = "${element(aws_instance.local.*.id, count.index)}"

  count = "${var.nodes}"
}
