module "my_ip_icmp" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "my-ip-icmp"
  description = "Security group for ICMP protocol from my-ip"
  vpc_id      = var.vpc_id
  ingress_with_cidr_blocks = [
    {
      to_port     = -1
      from_port   = -1
      protocol    = "icmp"
      description = "ICMP"
      cidr_blocks = format("%s/%s", var.my_ip, "32")
    }
  ]
  ingress_with_self = [
    {
      to_port     = -1
      from_port   = -1
      protocol    = "icmp"
      description = "Allow all ingress ICMP traffic from self"
      self        = true
    }
  ]
}

module "my_ip_rdp" {
  source = "terraform-aws-modules/security-group/aws//modules/rdp"

  name              = "my-ip-rdp"
  description       = "Security group for RDP from my-ip"
  vpc_id            = var.vpc_id
  auto_egress_rules = []

  ingress_cidr_blocks = [format("%s/%s", var.my_ip, "32")]

  tags = {
    env = var.env
  }
}

module "my_ip_ssh" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name              = "my-ip-ssh"
  description       = "Security group for SSH from my-ip"
  vpc_id            = var.vpc_id
  auto_egress_rules = []

  ingress_cidr_blocks = [format("%s/%s", var.my_ip, "32")]

  tags = {
    env = var.env
  }

}

module "http_80" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                   = "http-80"
  description            = "Security group for http-80"
  vpc_id                 = var.vpc_id
  auto_egress_rules      = []
  auto_ingress_with_self = []

  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = {
    env = var.env
  }

}

module "https_443" {
  source = "terraform-aws-modules/security-group/aws//modules/https-443"

  name                   = "https-443"
  description            = "Security group for https-443"
  vpc_id                 = var.vpc_id
  auto_egress_rules      = []
  auto_ingress_with_self = []

  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = {
    env = var.env
  }

}