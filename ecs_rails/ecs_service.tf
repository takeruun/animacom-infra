resource "aws_lb_target_group" "target_group" {
  name = "${var.app_name}-tg"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  # ALBからECSタスクのコンテナへトラフィックを振り分ける設定
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  # コンテナへの死活監視設定
  health_check {
    port = 80
    path = "/health"
  }
}
resource "aws_lb_listener_rule" "http_rule" {
  listener_arn = data.terraform_remote_state.alb.outputs.http_listener_arn

  # 受け取ったトラフィックをターゲットグループへ受け渡す
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.id
  }

  # ターゲットグループへ受け渡すトラフィックの条件
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

resource "aws_lb_listener_rule" "https_rule" {
  listener_arn = data.terraform_remote_state.alb.outputs.https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.id
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

resource "aws_ecs_service" "ecs_service" {
  name                   = "${var.app_name}-service"
  launch_type            = "FARGATE"
  desired_count          = "1"
  cluster                = aws_ecs_cluster.this.name
  task_definition        = aws_ecs_task_definition.task_definition.arn
  enable_execute_command = true
  network_configuration {
    security_groups  = [data.terraform_remote_state.alb.outputs.alb_security_group]
    subnets          = data.terraform_remote_state.network.outputs.public_subnet_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "animacom_server"
    container_port   = 80
  }
}
