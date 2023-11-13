output "gitlab_name" {
  value = data.aws_route53_zone.gitlab.name
}

output "zone_id" {
  value = data.aws_route53_zone.gitlab.zone_id
}

output "vpc_id" {
  value = data.aws_vpc.shared.id
}

output "route_name" {
  value = data.aws_route53_zone.shared.name
}
output "route_zone_id" {
  value = data.aws_route53_zone.shared.zone_id
}

output "vpn_name" {
  value = data.aws_route53_zone.vpn.name
}

output "vpn_zone_id" {
  value = data.aws_route53_zone.vpn.zone_id
}


#subnets

output "private_networking_1" {
  value = data.aws_subnet.private_networking_1.id
}
output "private_networking_2" {
  value = data.aws_subnet.private_networking_2.id
}
output "private_networking_3" {
  value = data.aws_subnet.private_networking_3.id
}