variable "vpn_subdomain" {
  type        = string
  default     = "admin."
  description = "The subdomain name of the VPN that is used to access the VPN admin dashboard"
}
variable "gitlab_hosted_zone_name" {
  type        = string
  default     = "gitlab.mydomain.com"
  description = "The name of the hosted zone where we set the record of the Gitlab domain"
}

variable "vpn_hosted_zone_name" {
  type        = string
  default     = "vpn.mydomain.com"
  description = "The name of the hosted zone where we set the record of the VPN subdomain"
}