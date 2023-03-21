# This file is to contain all environment related configurations, name, region, domain, IPs, 
# AWS Region
# Terraform Block
terraform {
  required_version = "~> 1.4.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.59.0"
    }
  }
}
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "eu-central-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "prod"
}
#Domain definition
variable "domain" {
  description = "Domain name for enviroment creation"
  type        = string
  default     = "helpsavethe.world"
}
# Project and Company data
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "gw"
}
variable "project_name" {
  description = "Project name prefix used for naming conventions"
  type        = string
  default     = "gw"
}
variable "Company" {
  description = "This is company name"
  type        = string
  default     = "Greenworlder"
}