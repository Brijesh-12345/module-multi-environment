# variables.tf

variable "ami" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for launch template"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
}

variable "sg_id" {
  description = "Security group ID to associate with instances and ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for bastion host and ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for autoscaling group"
  type        = list(string)
}
