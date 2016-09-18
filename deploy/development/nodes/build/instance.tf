variable "name" {
  default = "build"
}

variable "type" {
  default = "t2.micro"
}

variable "nodes" {
  default = 1
}

variable "tags" {
  default = "base,build"
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

    name = "${var.name}-${var.deploy}"
    tags = "${var.tags}"
    deploy = "${var.deploy}"
    region = "${var.region}"
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

  root_block_device {
    volume_type = "gp2"
    volume_size = 200
  }

  tags {
    Name = "${var.name}-${var.deploy}"
    Managed = "Terraform"
  }

  //depends_on = [ "aws_eip.local" ]
}
