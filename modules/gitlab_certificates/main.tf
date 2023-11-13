module "data" {
  source = "../data"
}

resource "aws_acm_certificate" "gitlab" {
  domain_name       = module.data.gitlab_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Purpose = "Gitlab Certificate validation"
  }
}

resource "aws_route53_record" "gitlab_certificate_validation" {
  for_each = {
    for option in aws_acm_certificate.gitlab.domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      record = option.resource_record_value
      type   = option.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = module.data.zone_id
}

resource "aws_acm_certificate_validation" "gitlab" {
  certificate_arn         = aws_acm_certificate.gitlab.arn
  validation_record_fqdns = [for record in aws_route53_record.gitlab_certificate_validation : record.fqdn]
}
