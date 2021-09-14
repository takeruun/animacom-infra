resource "aws_security_group" "this" {
  name        = "${var.app_name}-redis"
  description = "security group on redis of ${var.app_name}"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-sg"
  }
}

resource "aws_security_group_rule" "redis-rule" {
  security_group_id = aws_security_group.this.id

  type = "ingress"

  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.alb.outputs.alb_security_group
}
