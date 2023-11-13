variable "vpn_instance_ip" {
  type = string
  description = "The IP of the vpn instance"
}

variable "vpn_subdomain" {
  type = string
  description = "The sub domain name of the vpn that is use to access the vpn admin dashboard"
}

variable "vpn_hosted_zone_name" {
  type = string
  description = "The name of the hosted zone where we set the record of the vpn subdomain"
}

variable "gitlab_instance_ip" {
  type = string
  description = "The IP of the Gitlab instance"
}

variable "gitlab_hosted_zone_name" {
  type = string
  description = "The name of the hosted zone where we set the record of the gitlab domain"
}

variable "shared_hosted_zone_name" {
  type = string
  description = "The name of the hosted zone where we set the record of the shared subdomains"
}
