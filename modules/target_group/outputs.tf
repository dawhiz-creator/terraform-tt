output "arn" {
    value = aws_lb_target_group.vpn_https.arn
}

output "gitlab_arn" {
  value = aws_lb_target_group.gitlab_https.arn
}