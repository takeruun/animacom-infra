output "member_clusters" {
  value = aws_elasticache_replication_group.this.member_clusters
}

output "redis_url" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}
