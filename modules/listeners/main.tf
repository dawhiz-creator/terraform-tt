
module "alb" {
  source = "../alb"
}


module "gitlab_certificates" {
  source = "../gitlab_certificates"
}

module "shared_certificates" {
  source = "../shared_certificates"
}

module "vpn_certificates" {
  source = "../vpn_certificates"
}

module "target_group" {
  source = "../target_group"
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = module.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = module.shared_certificates.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = module.target_group.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

### VPN
resource "aws_lb_listener_certificate" "vpn" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = module.vpn_certificates.acm_vpn
}

resource "aws_lb_listener_rule" "vpn" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = module.target_group.gitlab_arn
  }

  condition {
    host_header {
      values = ["${var.vpn_subdomain}${var.vpn_hosted_zone_name}"]
    }
  }
}

### GITLAB
resource "aws_lb_listener_certificate" "gitlab" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = module.gitlab_certificates.gitlab_cert_arn
}

resource "aws_lb_listener_rule" "gitlab" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 110

  action {
    type             = "forward"
    target_group_arn = module.target_group.gitlab_arn
  }

  condition {
    host_header {
      values = [var.gitlab_hosted_zone_name]
    }
  }
}
