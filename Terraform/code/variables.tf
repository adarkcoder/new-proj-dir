variable "region" {
  description = "The AWS region to deploy to."
  default     = "ap-south-1"
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default     = "my-eks-cluster"
}


variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "../.ssh/id_rsa.pub"
}



variable "db_cluster_identifier" {
  description = "Identifier for the RDS cluster"
  type        = string
  default     = "my-rds-cluster"
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "dbeks"
}

variable "db_username" {
  description = "Username for the database administrator"
  type        = string
  default = "master"
}

variable "db_password" {
  description = "Password for the database administrator"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
  default     = "db.m5d.large" # Adjust instance type as needed
}

variable "db_engine" {
  description = "Engine for the RDS cluster"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Engine version for the RDS cluster"
  type        = string
  default     = "8.0.35" # Adjust version as needed
}

variable "db_backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
  default     = 7 # Adjust retention period as needed
}

variable "db_maintenance_window" {
  description = "Time window for RDS maintenance in UTC"
  type        = string
  default     = "Mon:00:00-Mon:03:00" # Adjust maintenance window as needed
}

variable "rds_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "rds-subnet-grp-1"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS database (in GB)"
  type        = number
  default     = 20 # Adjust storage size as needed

}

variable "db_storage_type" {
  description = "storage type for the RDS database"
  type        = string
  default     = "gp3" # Adjust storage size as needed

}


variable "bastion_ami" {
  description = "AMI to use for the Bastion host"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8" # Change this to the appropriate AMI for your region
}

variable "bastion_instance_type" {
  description = "Instance type for the Bastion host"
  type        = string
  default     = "t3.micro"
}

variable "bastion_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "../bastion_keys/.ssh/my_bastion_key.pub"
}