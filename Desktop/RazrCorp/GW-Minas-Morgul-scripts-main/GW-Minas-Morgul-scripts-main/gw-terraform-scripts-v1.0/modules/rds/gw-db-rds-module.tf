# Create VPC Terraform Module
module "rds_db_instance" {
  source  = "terraform-aws-modules/rds/aws//modules/db_instance"
  version = "5.6.0"

  # insert the 1 required variable here
  #cluster_identifier = "example"
  #count = 1

  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class = "db.t3.large"
  identifier           = "test"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  #need to add subnet group name 
  db_subnet_group_name = "rds_subnet_group"
  
}