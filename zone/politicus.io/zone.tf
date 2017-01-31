resource "aws_route53_zone" "politicus-io" {
  name = "politicus.io"
}

output "name_servers" {
  value = "${join(",", aws_route53_zone.politicus-io.name_servers)}"
}

output "zone_id" {
  value = "${aws_route53_zone.politicus-io.zone_id}"
}
