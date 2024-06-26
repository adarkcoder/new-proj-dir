module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.cidr_block

  depends_on = [module.vpc]
}

module "eks" {
  source = "./modules/eks"

  cluster_name     = var.cluster_name
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  private_subnets  = module.vpc.private_subnets
  cluster_sg_id    = module.security_groups.cluster_sg_id
  node_group_sg_id = module.security_groups.node_group_sg_id
  public_key_path  = var.public_key_path

  depends_on = [module.security_groups]
}

module "rds" {
  source = "./modules/rds"

  subnet_ids                 = module.vpc.private_subnets
  db_name                    = var.db_name
  db_engine                  = var.db_engine
  db_username                = var.db_username
  db_password                = var.db_password
  db_instance_class          = var.db_instance_class
  allocated_storage          = var.db_allocated_storage
  db_storage_type            = var.db_storage_type
  db_engine_version          = var.db_engine_version
  db_backup_retention_period = var.db_backup_retention_period
  db_cluster_identifier      = var.db_cluster_identifier
  vpc_security_group_ids     = [module.security_groups.rds_sg_id]
  subnet_group_name          = var.rds_subnet_group_name

  depends_on = [module.security_groups]
}


module "bastion" {
  source = "./modules/bastion"

  ami               = var.bastion_ami
  instance_type     = var.bastion_instance_type
  subnet_id         = element(module.vpc.public_subnets, 0)
  key_name          = var.public_key_path
  security_group_id = module.security_groups.bastion_security_group_id


  depends_on = [module.security_groups]
}