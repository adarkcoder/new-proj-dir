output "rds_cluster_endpoint" {
  value = aws_rds_cluster.rds_cluster.endpoint
}

output "rds_cluster_reader_endpoint" {
  value = aws_rds_cluster.rds_cluster.reader_endpoint
}