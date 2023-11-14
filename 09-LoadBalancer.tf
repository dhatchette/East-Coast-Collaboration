resource "aws_lb" "proj1_alb" {
  name               = "proj1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.project1-sg02-LB01.id]
  subnets = [
    aws_subnet.public-ap-southeast-4a.id,
    aws_subnet.public-ap-southeast-4b.id,
    aws_subnet.public-ap-southeast-4c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "App1LoadBalancer"
    Service = "Proj1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.proj1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.proj1_tg.arn
  }
}
