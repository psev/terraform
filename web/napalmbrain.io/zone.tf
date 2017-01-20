resource "aws_route53_record" "blog-napalmbrain-io" {
  zone_id = "${data.terraform_remote_state.napalmbrain-io.zone_id}"
  name = "napalmbrain.io"
  type= "A"

  alias {
    name = "${aws_cloudfront_distribution.blog_front.domain_name}"
    zone_id = "${aws_cloudfront_distribution.blog_front.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "blog-www-napalmbrain-io" {
  zone_id = "${data.terraform_remote_state.napalmbrain-io.zone_id}"

  name = "www.napalmbrain.io"
  type= "CNAME"
  ttl = "60"

  records = [ "napalmbrain.io" ]
}
