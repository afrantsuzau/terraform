provider "aws" {
  region = var.region
}

resource "aws_route53_record" "main_record" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain
  type    = "A"

  alias {
    name                   = data.aws_lb.current.dns_name
    zone_id                = data.aws_lb.current.zone_id
    evaluate_target_health = true
  }
}
