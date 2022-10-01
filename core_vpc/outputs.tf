output "vpc_id" {
  value = module.core_vpc.vpc_id
}
output "public_subnets_ids" {
  value = module.core_vpc.public_subnets
}
output "private_subnets_ids" {
  value = module.core_vpc.private_subnets
}