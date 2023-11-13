
module "alb" {
  source = "./modules/alb"
}

module "data" {
  source = "./modules/data"
  gitlab_hosted_zone_name = var.gitlab_hosted_zone_name
  vpn_hosted_zone_name = var.vpn_hosted_zone_name
  shared_hosted_zone_name = var.shared_hosted_zone_name
}

module "gitlab_certificates" {
  source = "./modules/gitlab_certificates"
}

module "listeners" {
  source = "./modules/listeners"
  vpn_subdomain = var.vpn_subdomain
  gitlab_hosted_zone_name = var.gitlab_hosted_zone_name
  vpn_hosted_zone_name = var.vpn_hosted_zone_name
}

module "security_group" {
  source = "./modules/security_group"
}

module "shared_certificates" {
  source = "./modules/shared_certificates"
}

module "target_group" {
  source = "./modules/target_group"
  vpn_instance_ip = var.vpn_instance_ip
  gitlab_instance_ip = var.gitlab_instance_ip
}

module "vpn_certificates" {
  source = "./modules/vpn_certificates"
  vpn_subdomain = var.vpn_subdomain
}

module "zone_records" {
  source = "./modules/zone_records"
  vpn_subdomain = var.vpn_subdomain
}
