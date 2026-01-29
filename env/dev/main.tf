module "network" {
  source = "../../modules/network"

  env      = var.env
  app_name = var.app_name
}

module "compute" {
  source = "../../modules/compute"

  env              = var.env
  app_name         = var.app_name
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name

  asg_min          = var.asg_min
  asg_max          = var.asg_max
  asg_desired      = var.asg_desired

  vpc_id           = module.network.vpc_id
  private_subnets  = module.network.private_subnets
  security_group_id = module.network.app_sg_id
}

module "db" {
  source = "../../modules/db"

  env         = var.env
  app_name    = var.app_name

  subnet_ids = module.network.db_subnets
  username   = var.db_username
  password   = var.db_password
}
