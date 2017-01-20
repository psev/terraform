resource "aws_route53_record" "mx-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "napalmbrain.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "mx-star-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "*.napalmbrain.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "a-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "mail.napalmbrain.io"
  type= "A"
  ttl = "60"
  records = [
    "66.111.4.147",
    "66.111.4.148"
    ]
}

resource "aws_route53_record" "mx-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "mail.napalmbrain.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "smtp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "mesmtp._domainkey.napalmbrain.io"
  type= "TXT"
  ttl = "60"
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDFZL29KOyMGWCFys7XTSJpnB5dmQDGSWcKwTTJVLo+dvHIBkctOjEXtEjeFDV98Tc9ei2V8+pz5Att7nFkY4Ncl95ftTupB2V+PG/0JkQ38cUSJnxOka7f8gkigX89cgf0YsSsZoQVPN3hfCeuvYJO9cvfpz3164zqPK3UxFNUIwIDAQAB"
    ]
}

resource "aws_route53_record" "adsp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_adsp._domainkey.napalmbrain.io"
  type= "TXT"
  ttl = "60"
  records = [ "dkim=unknown" ]
}

resource "aws_route53_record" "fastmail-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "napalmbrain.io"
  type= "TXT"
  ttl = "60"
  records = [ "v=spf1 include:spf.messagingengine.com ?all" ]
}

resource "aws_route53_record" "client-smtp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_client._smtp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "1 1 1 napalmbrain.io" ]
}

resource "aws_route53_record" "submission-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_submission._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 587 smtp.fastmail.com" ]
}

resource "aws_route53_record" "imap-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_imap._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "imaps-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_imaps._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 993 imap.fastmail.com" ]
}

resource "aws_route53_record" "pop-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_pop3._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "pops-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_pop3s._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "10 1 995 pop.fastmail.com" ]
}

resource "aws_route53_record" "carddav-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_carddav._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "carddavs-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_carddavs._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}

resource "aws_route53_record" "caldav-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_caldav._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "caldavs-tcp-mail-napalmbrain-io" {
  zone_id = "${aws_route53_zone.napalmbrain-io.zone_id}"

  name = "_caldavs._tcp.napalmbrain.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}
