resource "aws_lb_target_group" "proj1_tg" {
  name        = "proj1-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.project1.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "Proj1TargetGroup"
    Service = "Proj1"
    Owner   = "User"
    Project = "Web Service"
  }
}
