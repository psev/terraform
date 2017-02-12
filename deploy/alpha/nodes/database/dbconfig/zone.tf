resource "aws_route53_record" "local" {
  zone_id = "${data.terraform_remote_state.network.zone_id}"

  name = "${var.role}-${var.cluster}-${count.index + 1}"
  type = "A"
  ttl = "30"

  records = [ "${element(aws_instance.local.*.private_ip, count.index)}" ]

  count = "${var.nodes}"
}
