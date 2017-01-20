resource "aws_route53_record" "control" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "${var.role}-${count.index + 1}"
  type = "A"
  ttl = "30"

  records = [ "${element(aws_instance.local.*.private_ip, count.index)}" ]

  count = "${var.nodes}"
}

resource "aws_route53_record" "consul" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "consul-${count.index + 1}"
  type = "A"
  ttl = "30"

  records = [ "${element(aws_instance.local.*.private_ip, count.index)}" ]

  count = "${var.nodes}"
}

resource "aws_route53_record" "etcd" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "etcd-${count.index + 1}"
  type = "A"
  ttl = "30"

  records = [ "${element(aws_instance.local.*.private_ip, count.index)}" ]

  count = "${var.nodes}"
}

resource "aws_route53_record" "etcd-server" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "_etcd-server._tcp"
  type = "SRV"
  ttl = "30"

  records = [ "${formatlist("0 0 2380 %s", aws_route53_record.consul.*.fqdn)}" ]
}

resource "aws_route53_record" "etcd-client" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "_etcd-client._tcp"
  type = "SRV"
  ttl = "30"

  records = [ "${formatlist("0 0 2379 %s", aws_route53_record.consul.*.fqdn)}" ]
}
