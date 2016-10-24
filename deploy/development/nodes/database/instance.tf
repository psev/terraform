variable "name" {
  default = "database"
}

variable "type" {
  default = "t2.micro"
}

variable "nodes" {
  default = 1
}

variable "role" {
  default = "database"
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
    role = "${var.role}"
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

  tags {
    Name = "${var.name}-${var.deploy}"
    Managed = "terraform-${var.deploy}"
  }
}
