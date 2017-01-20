resource "aws_route53_record" "local" {
  zone_id = "${data.terraform_remote_state.sugarush-io.zone_id}"

  name = "${var.role}-${var.deploy}"
  type = "A"
  ttl = "300"

  records = [ "${aws_instance.local.*.public_ip}" ]
}
