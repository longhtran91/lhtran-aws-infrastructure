variable "vpc_id" {
  type        = string
  description = "VPC to deploy SGs"
}
variable "my_ip" {
  type        = string
  description = "My public IP"
}
variable "env" {
  type        = string
  description = "Environment"
  validation {
    condition     = contains(["production", "development", "test"], var.env)
    error_message = "Environment must be production, development or test"
  }
}