output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  value = module.security_groups.cluster_sg_id
}

output "rds_cluster_endpoint" {
  value = module.rds.rds_cluster_endpoint
}

output "rds_cluster_reader_endpoint" {
  value = module.rds.rds_cluster_reader_endpoint
}

output "bastion_instance_id" {
  value = module.bastion.bastion_instance_id
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}