resource "aws_route53_zone" "public" {
  name = "sugarush.io"
}

output "name_servers" {
  value = "${join(",", aws_route53_zone.public.name_servers)}"
}

output "zone_id" {
  value = "${aws_route53_zone.public.zone_id}"
}
