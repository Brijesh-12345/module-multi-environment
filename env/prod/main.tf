module "vpc" {
  source = "../../modules/vpc"
}

module "network" {
  source   = "../../modules/network"
  vpc_id   = module.vpc.vpc_id
}

module "compute" {
  source          = "../../modules/compute"
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_app_subnets
  sg_id           = module.network.app_sg_id
}

module "db" {
  source      = "../../modules/db"
  db_subnets  = module.network.db_subnets
  username    = var.db_username
  password    = var.db_password
}

module "endpoints" {
  source        = "../../modules/endpoints"
  vpc_id        = module.vpc.vpc_id
  private_rt_id = module.network.private_rt_id
}
