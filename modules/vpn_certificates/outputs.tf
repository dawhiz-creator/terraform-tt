output "acm_vpn" {
  value = aws_acm_certificate_validation.vpn.certificate_arn
}