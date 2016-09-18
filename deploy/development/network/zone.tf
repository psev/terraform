output "zone_id" {
  value = "${aws_route53_zone.private.zone_id}"
}

resource "aws_route53_zone" "private" {
  name = "${var.identifier}-${var.deploy}.${var.region}.aws."

  vpc_id = "${aws_vpc.local.id}"
}

resource "aws_route53_record" "private" {
  zone_id = "${aws_route53_zone.private.id}"

  name = "${var.identifier}-${var.deploy}.${var.region}.aws."
  type = "NS"
  ttl = "30"

  records = [
    "${aws_route53_zone.private.name_servers.0}",
    "${aws_route53_zone.private.name_servers.1}",
    "${aws_route53_zone.private.name_servers.2}",
    "${aws_route53_zone.private.name_servers.3}"
  ]
}
