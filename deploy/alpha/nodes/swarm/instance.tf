variable "role" {
  default = "swarm"
}

variable "type" {
  default = "t2.micro"
}

variable "nodes" {
  default = 3
}

output "nodes" {
  value = "${var.nodes}"
}

output "private_ips" {
  value = "${join(",", aws_instance.local.*.private_ip)}"
}

output "public_ips" {
  value = "${join(",", aws_instance.local.*.public_ip)}"
}

data "template_file" "userdata" {
  template = "${file("${path.module}/scripts/userdata.sh")}"

  vars {
    ansible_key = "${file("${path.module}/scripts/github.key")}"
    ansible_repo = "${var.ansible_repo}"

    hostname = "${var.role}-${var.deploy}"
    role = "${var.role}"
    deploy = "${var.deploy}"
    region = "${var.region}"
    identifier = "${var.identifier}"
  }
}

resource "aws_instance" "local" {
  ami = "${element(split(",", lookup(var.amis, var.region)), 0)}"
  key_name = "${var.key}"
  instance_type = "${var.type}"
  subnet_id = "${element(split(",", data.terraform_remote_state.network.private_subnet_ids), count.index)}"
  vpc_security_group_ids = [ "${aws_security_group.local.id}" ]
  user_data = "${data.template_file.userdata.rendered}"
  iam_instance_profile = "${aws_iam_instance_profile.ec2.name}"
  count = "${var.nodes}"

  tags {
    Name = "${var.role}-${var.deploy}"
    Managed = "terraform-${var.deploy}"
  }
}
