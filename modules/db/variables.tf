

variable "db_subnets" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
