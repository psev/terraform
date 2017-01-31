resource "aws_route53_record" "blog-politicus-io" {
  zone_id = "${data.terraform_remote_state.politicus-io.zone_id}"
  name = "politicus.io"
  type= "A"

  alias {
    name = "${aws_cloudfront_distribution.blog_front.domain_name}"
    zone_id = "${aws_cloudfront_distribution.blog_front.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "blog-www-politicus-io" {
  zone_id = "${data.terraform_remote_state.politicus-io.zone_id}"

  name = "www.politicus.io"
  type= "CNAME"
  ttl = "60"

  records = [ "politicus.io" ]
}
