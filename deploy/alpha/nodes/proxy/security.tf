resource "aws_security_group" "local" {
  vpc_id = "${data.terraform_remote_state.network.vpc_id}"

  tags {
    Name = "${var.role}-${var.deploy}"
  }
}

resource "aws_security_group_rule" "private-in" {
  type = "ingress"
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "private-out" {
  type = "egress"
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "ssh-world-in" {
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["107.50.144.142/32"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "ssh-required-out" {
  # Allow SSH to Github
  type = "egress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = [
    # Allow SSH to local nodes
    "10.0.0.0/8",
    "172.16.0.0/12",

    # Allow SSH to Github
    "192.30.252.0/22"
  ]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "dns-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 53
  to_port = 53
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "http-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "ntp-world-out" {
  type = "egress"
  protocol = "udp"
  from_port = 123
  to_port = 123
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "https-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "consul-tcp-private-in" {
  type = "ingress"
  protocol = "tcp"
  from_port = 8300
  to_port = 8302
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "consul-udp-private-in" {
  type = "ingress"
  protocol = "udp"
  from_port = 8300
  to_port = 8302
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "consul-tcp-private-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 8300
  to_port = 8302
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "consul-udp-private-out" {
  type = "egress"
  protocol = "udp"
  from_port = 8300
  to_port = 8302
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.local.id}"
}

resource "aws_security_group_rule" "logentries-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 20000
  to_port = 20000
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.local.id}"
}
