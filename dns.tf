data "aws_route53_zone" "selected" {
  name         = "${var.dns_suffix}."
}

resource "aws_route53_record" "pcf-1" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "spring-music"
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 0
  }

  set_identifier = "pcf-use1"
  records        = ["spring-music.${module.pcf-1.apps_domain}"]
}

resource "aws_route53_record" "pcf-2" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "spring-music"
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 0
  }

  set_identifier = "pcf-usw2"
  records        = ["spring-music.${module.pcf-2.apps_domain}"]
}