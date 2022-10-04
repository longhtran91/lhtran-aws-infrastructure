module "core_vpc" {
  source = "./core_vpc"

  region          = var.region
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  num_azs         = var.num_azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  env             = var.env
  public_key      = var.public_key

}

module "security_groups" {
  source = "./security_groups"

  vpc_id = module.core_vpc.vpc_id
  my_ip  = var.my_ip
  env    = var.env
}