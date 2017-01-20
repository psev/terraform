resource "aws_route53_zone" "sugarush-io" {
  name = "sugarush.io"
}

output "name_servers" {
  value = "${join(",", aws_route53_zone.sugarush-io.name_servers)}"
}

output "zone_id" {
  value = "${aws_route53_zone.sugarush-io.zone_id}"
}
