output "gitlab_cert_arn" {
  value = aws_acm_certificate_validation.gitlab.certificate_arn
}