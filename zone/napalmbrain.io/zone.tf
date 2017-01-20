resource "aws_route53_zone" "napalmbrain-io" {
  name = "napalmbrain.io"
}

output "name_servers" {
  value = "${join(",", aws_route53_zone.napalmbrain-io.name_servers)}"
}

output "zone_id" {
  value = "${aws_route53_zone.napalmbrain-io.zone_id}"
}
