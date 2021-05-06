variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-0da3fad2a3696a88d"
}

variable "subnets" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = ["subnet-0d0c40d85f2d07d07", "subnet-01174593b2db8c652"]
}

variable "username" {
  description = "Master DB Name"
  type = string 
  default = "emro"
  
}

variable "password" {
  description = "Master DB password"
  default = "emrodevtest"
}

variable "database_name" {
  description = "Master DB name "
  type = string 
  default =  "EMRODEV"

}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  default    = "db.m5.large"
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes."
  default     = 50
}
variable "multi_az" {
  default     = false
  description = "Specifies if the RDS instance is multi-AZ."
}

