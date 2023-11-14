resource "aws_autoscaling_group" "proj1_asg" {
  name_prefix      = "proj1-auto-scaling-group-"
  min_size         = 3
  max_size         = 15
  desired_capacity = 6
  vpc_zone_identifier = [
    aws_subnet.private-ap-southeast-4a.id,
    aws_subnet.private-ap-southeast-4b.id,
    aws_subnet.private-ap-southeast-4c.id
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.proj1_tg.arn]

  launch_template {
    id      = aws_launch_template.proj1_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                 = "scale-in-protection"
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
  }

  tag {
    key                 = "Name"
    value               = "proj1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "proj1_scaling_policy" {
  name                   = "proj1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.proj1_asg.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "proj1_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.proj1_asg.name
  alb_target_group_arn   = aws_lb_target_group.proj1_tg.arn
}
