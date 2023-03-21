# Create VPC Terraform Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "3.19.0"

  # VPC Basic Details
  name             = "${var.project_name}-${var.environment}-vpc-${var.aws_region}"
  cidr             = var.vpc_cidr
  azs              = var.vpc_azs_name
  public_subnets   = var.vpc_public_subnets_cidr
  database_subnets = var.vpc_database_subnets_cidr
  private_subnets  = var.vpc_private_subnets_cidr
  database_subnet_group_name = var.database_subnet_group_name
  

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway
  enable_vpn_gateway = var.vpc_enable_vpn_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Region         = var.aws_region
    Environment    = var.environment
    Name           = "${var.project_name}-${var.environment}-vpc-${var.aws_region}"
    "Project Name"   = var.project_name
  }

}