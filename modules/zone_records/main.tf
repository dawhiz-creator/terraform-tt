
module "data" {
  source = "../data"
}

module "alb" {
  source = "../alb"
}

resource "aws_route53_record" "vpn" {
  zone_id = module.data.vpn_zone_id
  name    = "${var.vpn_subdomain}${module.data.vpn_name}"
  type    = "A"

  alias {
    name                   = module.alb.arn_dns_name
    zone_id                = module.alb.arn_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "gitlab" {
  zone_id = module.data.zone_id
  name    = module.data.gitlab_name
  type    = "A"

  alias {
    name                   = module.alb.arn_dns_name
    zone_id                = module.alb.arn_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "shared" {
  zone_id = module.data.route_zone_id
  name    = module.data.route_name
  type    = "A"

  alias {
    name                   = module.alb.arn_dns_name
    zone_id                = module.alb.arn_zone_id
    evaluate_target_health = true
  }
}
