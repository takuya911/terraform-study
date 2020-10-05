resource "aws_security_group" "ecs" {
  name        = "go-pf-ecs"
  description = "go-pf ecs"
  vpc_id      = "${aws_vpc.main.id}"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "go-pf-ecs"
  }
}

resource "aws_security_group_rule" "ecs" {
  security_group_id = "${aws_security_group.ecs.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
}

resource "aws_ecs_service" "main" {
  name       = "go-pf"
  depends_on = ["aws_lb_listener_rule.main"]

  cluster = "${aws_ecs_cluster.main.name}"

  launch_type     = "FARGATE"
  desired_count   = "1"
  task_definition = "${aws_ecs_task_definition.main.arn}"
  network_configuration {
    subnets         = ["${aws_subnet.private_1a.id}", "${aws_subnet.private_1c.id}", "${aws_subnet.private_1d.id}"]
    security_groups = ["${aws_security_group.ecs.id}"]
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    container_name   = "nginx"
    container_port   = "80"
  }
}