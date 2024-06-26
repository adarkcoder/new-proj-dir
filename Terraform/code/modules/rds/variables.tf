variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "db_cluster_identifier" {
  description = "Identifier for the RDS cluster"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "Username for the database administrator"
  type        = string
}

variable "db_password" {
  description = "Password for the database administrator"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
}

variable "db_engine" {
  description = "Engine for the RDS cluster"
  type        = string
}

variable "db_engine_version" {
  description = "Engine version for the RDS cluster"
  type        = string
}

variable "db_backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
}


variable "subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS cluster"
  type        = list(string)
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS database (in GB)"
  type        = number
}

variable "db_storage_type" {
  description = "storage type for the RDS database"
  type = string
}