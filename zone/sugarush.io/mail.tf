resource "aws_route53_record" "mx-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "sugarush.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "mx-star-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "*.sugarush.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "a-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "mail.sugarush.io"
  type= "A"
  ttl = "60"
  records = [
    "66.111.4.147",
    "66.111.4.148"
    ]
}

resource "aws_route53_record" "mx-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "mail.sugarush.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "smtp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "mesmtp._domainkey.sugarush.io"
  type= "TXT"
  ttl = "60"
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDReQ1c/z+/xEhMtI6jxSPQMTW6gHA5vSJjyrwCz3ZK8csCpLkG0Kd+c2jXaye+2uyI4LCrL1BqxBqLWqGuLo5z7Ghq6wago1DIVY/SZKafwK56uJAO7gGI7u+Co9HtcyF8CIMVKvqrED/EHZ0eZEG1Mih/TLiJRt8qxC9MLCoy3wIDAQAB"
    ]
}

resource "aws_route53_record" "adsp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_adsp._domainkey.sugarush.io"
  type= "TXT"
  ttl = "60"
  records = [ "dkim=unknown" ]
}

resource "aws_route53_record" "fastmail-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "sugarush.io"
  type= "TXT"
  ttl = "60"
  records = [ "v=spf1 include:spf.messagingengine.com ?all" ]
}

resource "aws_route53_record" "client-smtp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_client._smtp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "1 1 1 sugarush.io" ]
}

resource "aws_route53_record" "submission-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_submission._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 587 smtp.fastmail.com" ]
}

resource "aws_route53_record" "imap-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_imap._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "imaps-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_imaps._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 993 imap.fastmail.com" ]
}

resource "aws_route53_record" "pop-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_pop3._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "pops-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_pop3s._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "10 1 995 pop.fastmail.com" ]
}

resource "aws_route53_record" "carddav-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_carddav._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "carddavs-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_carddavs._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}

resource "aws_route53_record" "caldav-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_caldav._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "caldavs-tcp-mail-sugarush-io" {
  zone_id = "${aws_route53_zone.sugarush-io.zone_id}"

  name = "_caldavs._tcp.sugarush.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}
