module "data" {
  source = "../data"
}


resource "aws_security_group" "alb" {
  name        = "Private ALB - Security Group"
  description = "General rules for ALB Interconnexion"
  vpc_id      = module.data.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["172.25.210.241/32"]
    ipv6_cidr_blocks = ["fe80::/64"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "Private ALB - Security Group"
  }
}
