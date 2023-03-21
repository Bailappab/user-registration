#VPC definition
variable "vpc_cidr" {
  default = "10.1.0.0/16"
}
variable "vpc_public_subnets_cidr" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.1.96.0/20", "10.1.112.0/20"]
}
variable "vpc_azs_name" {
  description = "List of AZS for our subnets"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}
variable "vpc_private_subnets_cidr" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.1.0.0/20", "10.1.16.0/20"]
}
variable "vpc_database_subnets_cidr" {
  description = "VPC Database Subnets"
  type        = list(string)
  default     = ["10.1.144.0/20", "10.1.176.0/20"]
}
variable "vpc_create_database_subnet_group" {
  type = string
  default = "rds_subnet_group"
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type        = bool
  default     = true
}

# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = true
}

# VPC Single VPN Gateway (True or False)
variable "vpc_enable_vpn_gateway" {
  description = "Enable only single VPN Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = false
}


# DNS Name
#variable "dns_name" {
#  type    = string
#  default = "${var.environment}.${var.domain}"
#}

# Provider Block
provider "aws" {
  region  = var.aws_region
  access_key = "AKIAZ3YZG2PVXLLYZZO2"
  secret_key = "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"
}

# EC2 Instance Variables
variable "instance_type" {
  default = "t3.micro"
}
variable "instance_count" {
  default = 2
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}

variable "ami" {
  default = "ami-0499632f10efc5a62"
}

variable "database_subnet_group_name" {
 type = string
 default = "rds_subnet_group"
}
