variable "project_name" {
  description = "Project name prefix used for naming conventions"
  type        = string
}
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}
variable "vpc_cidr" {
  type = string
}
variable "vpc_public_subnets_cidr" {
  description = "VPC Public Subnets"
  type        = list(string)
}
variable "vpc_azs_name" {
  description = "List of AZS for our subnets"
  type        = list(string)
}
variable "vpc_private_subnets_cidr" {
  description = "VPC Private Subnets"
  type        = list(string)
}
variable "vpc_database_subnets_cidr" {
  description = "VPC Database Subnets"
  type        = list(string)

}
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
}

# VPC Single VPN Gateway (True or False)
variable "vpc_enable_vpn_gateway" {
  description = "Enable only single VPN Gateway in one Availability Zone to save costs during our demos"
  type        = bool
}
variable "database_subnet_group_name" {
  type = string
}