data "aws_availability_zones" "available" {
  state = "available"
}

module "core_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = ">= 3.1"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = slice(data.aws_availability_zones.available.names, 0, var.num_azs)

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = false

  manage_default_security_group = true
  default_security_group_name = "default"
  default_security_group_ingress = [
    {
      to_port = 0
      from_port = 0
      protocol    = "-1"
      description = "Allow all ingress traffic from self"
      self = true
    }
  ]
  default_security_group_egress = [
    {
      to_port = 0
      from_port = 0
      protocol    = "-1"
      description = "Allow all egress traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  tags = {
    env = var.env
  }
  default_security_group_tags = {
    env = var.env
  }
}

resource "aws_key_pair" "lhtran_core_keypair" {
  key_name   = "lhtran-core-keypair"
  public_key = var.public_key
}