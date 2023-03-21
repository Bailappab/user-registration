module "vpc" {
  source                    = "./modules/vpc"
  project_name              = var.project_name
  aws_region                = var.aws_region
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  vpc_azs_name              = var.vpc_azs_name
  vpc_private_subnets_cidr  = var.vpc_private_subnets_cidr
  vpc_public_subnets_cidr   = var.vpc_public_subnets_cidr
  vpc_database_subnets_cidr = var.vpc_database_subnets_cidr
  

  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
  vpc_enable_vpn_gateway = var.vpc_enable_vpn_gateway
  vpc_single_nat_gateway = var.vpc_single_nat_gateway
  database_subnet_group_name = var.database_subnet_group_name
}
/*
module "rds_db_instance" {
  source                    = "./modules/rds"
  # insert the 1 required variable here
  project_name              = var.project_name
  aws_region                = var.aws_region
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  vpc_azs_name              = var.vpc_azs_name
  vpc_private_subnets_cidr  = var.vpc_private_subnets_cidr
  vpc_public_subnets_cidr   = var.vpc_public_subnets_cidr
  vpc_database_subnets_cidr = var.vpc_database_subnets_cidr

  vpc_enable_nat_gateway     = var.vpc_enable_nat_gateway
  vpc_enable_vpn_gateway     = var.vpc_enable_vpn_gateway
  vpc_single_nat_gateway     = var.vpc_single_nat_gateway
  database_subnet_group_name = var.database_subnet_group_name
}

module "autoscaling" {
  source  = "./modules/autoscaling"
    ami = var.ami
  # insert the 1 required variable here
  project_name              = var.project_name
  aws_region                = var.aws_region
  vpc_cidr                  = var.vpc_cidr
  vpc_azs_name              = var.vpc_azs_name
  vpc_private_subnets_cidr  = var.vpc_private_subnets_cidr
  vpc_public_subnets_cidr   = var.vpc_public_subnets_cidr
  vpc_database_subnets_cidr = var.vpc_database_subnets_cidr
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
  vpc_enable_vpn_gateway = var.vpc_enable_vpn_gateway
  vpc_single_nat_gateway = var.vpc_single_nat_gateway
  instance_type = var.instance_type
  environment = var.environment
}
*/
module "alb" {
  source  = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets
  #security_group = module.vpc.security_group
  project_name              = var.project_name
  aws_region                = var.aws_region
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  vpc_azs_name              = var.vpc_azs_name
  vpc_private_subnets_cidr  = var.vpc_private_subnets_cidr
  vpc_public_subnets_cidr   = var.vpc_public_subnets_cidr
  vpc_database_subnets_cidr = var.vpc_database_subnets_cidr
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
  vpc_enable_vpn_gateway = var.vpc_enable_vpn_gateway
  vpc_single_nat_gateway = var.vpc_single_nat_gateway
  database_subnet_group_name = var.database_subnet_group_name
}
