data "aws_elb_service_account" "current" {}

data "aws_vpc" "shared" {
  id = "vpc-123456789"
}

data "aws_subnet" "private_networking_1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shared.id]
  }
  filter {
    name   = "cidr-block"
    values = [cidrsubnet(data.aws_vpc.shared.cidr_block, 8, 0)]
  }
}

data "aws_subnet" "private_networking_2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shared.id]
  }
  filter {
    name   = "cidr-block"
    values = [cidrsubnet(data.aws_vpc.shared.cidr_block, 8, 1)]
  }
}

data "aws_subnet" "private_networking_3" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shared.id]
  }
  filter {
    name   = "cidr-block"
    values = [cidrsubnet(data.aws_vpc.shared.cidr_block, 8, 2)]
  }
}

data "aws_route53_zone" "gitlab" {
  name = var.gitlab_hosted_zone_name
}

data "aws_route53_zone" "vpn" {
  name = var.vpn_hosted_zone_name
}

data "aws_route53_zone" "shared" {
  name = var.shared_hosted_zone_name
}
