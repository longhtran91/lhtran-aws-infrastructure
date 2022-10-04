variable "region" {
  type        = string
  description = "Region to deploy VPC"
  validation {
    condition     = contains(["us-east-1", "us-east-2", "us-west-1", "us-west-2"], var.region)
    error_message = "Region must be in us-east-1, us-east-2, us-west-1, or us-west-2"
  }
}
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}
variable "vpc_cidr" {
  type        = string
  description = "VPC Cidr"
}
variable "num_azs" {
  type        = number
  description = "Number of the AZs that the subnet(s) will span"
}
variable "public_subnets" {
  type        = list(any)
  description = "List of public subnets"
}
variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
}
variable "env" {
  type        = string
  description = "Environment"
  validation {
    condition     = contains(["production", "development", "test"], var.env)
    error_message = "Environment must be production, development or test"
  }
}
variable "public_key" {
  type        = string
  description = "Core public key"
}