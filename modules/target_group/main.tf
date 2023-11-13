
module "data" {
  source = "../data"
}


resource "aws_lb_target_group" "gitlab_https" {
  name        = "GITLAB-HTTP"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.data.vpc_id
}

resource "aws_lb_target_group_attachment" "gitlab_https" {
  target_group_arn = aws_lb_target_group.gitlab_https.arn
  target_id        = var.gitlab_instance_ip
  depends_on       = [aws_lb_target_group.vpn_https]
}

resource "aws_lb_target_group" "vpn_https" {
  name        = "VPN-HTTPS"
  port        = 443
  protocol    = "HTTPS"
  target_type = "ip"
  vpc_id      = module.data.vpc_id
}

resource "aws_lb_target_group_attachment" "vpn_https" {
  target_group_arn = aws_lb_target_group.vpn_https.arn
  target_id        = var.vpn_instance_ip
  depends_on       = [aws_lb_target_group.vpn_https]
}
