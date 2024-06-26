output "cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "node_group_sg_id" {
  value = aws_security_group.eks_node_group_sg.id
}

output "rds_sg_id" {
  description = "ID of the RDS security group"
  value       = aws_security_group.rds_sg.id
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion_sg.id
}