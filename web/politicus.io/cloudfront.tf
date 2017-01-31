variable "origin_id" {
  default = "politicus.io"
}

resource "aws_cloudfront_distribution" "blog_front" {
  origin {
    domain_name = "${var.origin_id}.s3.amazonaws.com"
    origin_id   = "${var.origin_id}"

    custom_header {
      name = "Access-Control-Allow-Origin"
      value = "*"
    }
  }

  enabled             = true
  comment             = "${var.origin_id} Hero"
  default_root_object = "index.html"

  #logging_config {
  #  include_cookies = false
  #  bucket          = "mylogs.s3.amazonaws.com"
  #  prefix          = "myprefix"
  #}

  aliases = [ "${var.origin_id}", "www.${var.origin_id}" ]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "NL", "NZ", "AU", "ZA", "FR", "BE"]
    }
  }

  viewer_certificate {
    ssl_support_method = "sni-only"
    acm_certificate_arn = "arn:aws:acm:us-east-1:652495891140:certificate/e49822a0-8907-4265-b52b-47971327ccf3"
    minimum_protocol_version = "TLSv1"
    cloudfront_default_certificate = false
  }
}
