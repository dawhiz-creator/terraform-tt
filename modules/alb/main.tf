module "security_group" {
  source = "../security_group"
}

module "data" {
  source = "../data"
}

resource "aws_lb" "main" {
  name               = "PrivateALB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [module.security_group.sg_id]
  subnets            = [
    module.data.private_networking_1,
    module.data.private_networking_2,
    module.data.private_networking_3,
  ]

  drop_invalid_header_fields = true

  enable_deletion_protection = false

  tags = {
    Name = "PrivateALB"
  }
}
