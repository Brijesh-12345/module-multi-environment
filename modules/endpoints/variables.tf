# variables.tf

variable "vpc_id" {
  description = "The ID of the VPC where the endpoint will be created"
  type        = string
}

variable "private_rt_id" {
  description = "The ID of the private route table to associate with the VPC endpoint"
  type        = string
}
