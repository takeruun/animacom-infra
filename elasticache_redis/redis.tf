resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.app_name}-subnet-group"
  subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = "${var.app_name}-replication-group"
  replication_group_description = "redis group by terraform"
  node_type                     = "cache.t3.micro"
  number_cache_clusters         = 1
  automatic_failover_enabled    = false
  engine_version                = "6.x"
  security_group_ids            = [aws_security_group.this.id]
  subnet_group_name             = aws_elasticache_subnet_group.this.name

  # 変更を即反映する場合は有効にしておく
  apply_immediately = true
}
