provider "aws" {
  region = var.aws_region 

}
resource "aws_db_subnet_group" "oracle-subnets" {
  name        = "oracle-subnet-1"
  description = "RDS subnet group"
  subnet_ids  = var.subnets
  tags = {
    "Name" = "oracle-subnetsgroup"
  }

  
}

#ORACLE DB 
resource "aws_db_instance" "oracle" {
  allocated_storage      = 50 # 100 GB of storage, gives us more IOPS than a lower number
  engine                 = "oracle-ee"
  engine_version         = "19.0.0.0.ru-2021-01.rur-2021-01.r2"
  instance_class         = "db.m5.large" # use micro if you want to use the free tier
  identifier             = "oracledb"
  #vpc_id                 = var.vpc_id
  #subnets                = var.subnets
  name                   = var.database_name #It must be less than 8 characters  RDS name 
  # Make sure that database name is capitalized, otherwise RDS will try to recreate RDS instance every time
  username               = var.username        #Username of db
  password               = var.password # password
  vpc_security_group_ids = [aws_security_group.allow-oracle.id]
  #db_subnet_group_name   = aws_db_subnet_group.oracle-subnets.name
  db_subnet_group_name   = aws_db_subnet_group.oracle-subnets.name
  deletion_protection    = true
  backup_retention_period  = 15 #in days
  multi_az               = "false" # set to true to have high availability: 2 instances synchronized with each other
  storage_type           = "gp2"
  apply_immediately      = true
  skip_final_snapshot    = true
  max_allocated_storage  = 200 
  tags = {
    Name = "oracle-instance"
  }
}







