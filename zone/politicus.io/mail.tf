resource "aws_route53_record" "mx-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "politicus.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "mx-star-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "*.politicus.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "a-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "mail.politicus.io"
  type= "A"
  ttl = "60"
  records = [
    "66.111.4.147",
    "66.111.4.148"
    ]
}

resource "aws_route53_record" "mx-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "mail.politicus.io"
  type= "MX"
  ttl = "60"
  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in1-smtp.messagingengine.com"
  ]
}

resource "aws_route53_record" "smtp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "mesmtp._domainkey.politicus.io"
  type= "TXT"
  ttl = "60"
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDcPWd6o18k4sdqlMaq759QhbWp38YJ5zqI6d4GffdgP6raZFMWIFardPoSTEdIPmFR0Uld3M9i840bGppzMZ0GxJgRNYu1T5hMQ+hG1zhWkS50PlChus+oLhASzNzgKFj2E6lcSD4dzd39UGZf5nxqhV7Siq2zOc5GGROocB6OswIDAQAB"
    ]
}

resource "aws_route53_record" "adsp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_adsp._domainkey.politicus.io"
  type= "TXT"
  ttl = "60"
  records = [ "dkim=unknown" ]
}

resource "aws_route53_record" "fastmail-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "politicus.io"
  type= "TXT"
  ttl = "60"
  records = [ "v=spf1 include:spf.messagingengine.com ?all" ]
}

resource "aws_route53_record" "client-smtp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_client._smtp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "1 1 1 politicus.io" ]
}

resource "aws_route53_record" "submission-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_submission._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 587 smtp.fastmail.com" ]
}

resource "aws_route53_record" "imap-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_imap._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "imaps-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_imaps._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 993 imap.fastmail.com" ]
}

resource "aws_route53_record" "pop-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_pop3._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "pops-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_pop3s._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "10 1 995 pop.fastmail.com" ]
}

resource "aws_route53_record" "carddav-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_carddav._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "carddavs-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_carddavs._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}

resource "aws_route53_record" "caldav-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_caldav._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 0 0 ." ]
}

resource "aws_route53_record" "caldavs-tcp-mail-politicus-io" {
  zone_id = "${aws_route53_zone.politicus-io.zone_id}"

  name = "_caldavs._tcp.politicus.io"
  type= "SRV"
  ttl = "60"
  records = [ "0 1 443 carddav.fastmail.com" ]
}
