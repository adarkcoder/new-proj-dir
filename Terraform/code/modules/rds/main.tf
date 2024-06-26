resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier      = var.db_cluster_identifier
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  database_name           = var.db_name
  storage_type            = var.db_storage_type
  master_username         = var.db_username
  master_password         = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  allocated_storage       = var.allocated_storage
  backup_retention_period = var.db_backup_retention_period
  db_cluster_instance_class = var.db_instance_class
  skip_final_snapshot = true
  tags = {
    Name = var.db_cluster_identifier
  }
  lifecycle {
    ignore_changes = [ storage_type ]
  }
}

# resource "aws_rds_cluster_instance" "rds_cluster_instance" {
#   count             = 3
#   identifier        = "${var.db_cluster_identifier}-instance-${count.index + 1}"
#   cluster_identifier= aws_rds_cluster.rds_cluster.id
#   instance_class    = var.db_instance_class
#   engine            = var.db_engine
#   engine_version    = var.db_engine_version
# }