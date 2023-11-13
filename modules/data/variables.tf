variable "vpn_hosted_zone_name" {
  type        = string
  default     = "vpn.mydomain.com"
  description = "The name of the hosted zone where we set the record of the VPN subdomain"
}
variable "gitlab_hosted_zone_name" {
  type        = string
  default     = "gitlab.mydomain.com"
  description = "The name of the hosted zone where we set the record of the Gitlab domain"
}

variable "shared_hosted_zone_name" {
  type        = string
  default     = "shared.mydomain.com"
  description = "The name of the hosted zone where we set the record of the shared subdomains"
}