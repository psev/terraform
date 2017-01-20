resource "aws_route53_record" "blog-sugarush-io" {
  zone_id = "${data.terraform_remote_state.sugarush-io.zone_id}"
  name = "sugarush.io"
  type= "A"

  alias {
    name = "${aws_cloudfront_distribution.hero_front.domain_name}"
    zone_id = "${aws_cloudfront_distribution.hero_front.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "hero-sugarush-io" {
  zone_id = "${data.terraform_remote_state.sugarush-io.zone_id}"

  name = "www.sugarush.io"
  type= "CNAME"
  ttl = "60"

  records = [ "${aws_cloudfront_distribution.hero_front.domain_name}" ]
}
