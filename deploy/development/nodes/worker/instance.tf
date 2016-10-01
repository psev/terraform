variable "name" {
  default = "worker"
}

variable "type" {
  default = "t2.micro"
}

variable "nodes" {
  default = 3
}

variable "tags" {
  default = "base,worker"
}

variable "extra" {
  default = ""
}

output "nodes" {
  value = "${var.nodes}"
}

resource "template_file" "user_data" {
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
  user_data = "${template_file.user_data.rendered}"

  count = "${var.nodes}"

  tags {
    Name = "${var.name}-${var.deploy}"
    Managed = "terraform-${var.deploy}"  
  }
}
