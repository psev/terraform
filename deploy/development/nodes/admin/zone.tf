resource "aws_route53_record" "admin" {
  zone_id = "${data.terraform_remote_state.public.zone_id}"

  name = "admin"
  type = "A"
  ttl = "300"

  records = [ "${aws_instance.local.*.public_ip}" ]
}
