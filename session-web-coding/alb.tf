resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "tg")
  port     = local.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = local.app_port
  }
  tags = merge(local.tags, { Name = replace(local.name, "rtype", "tg") })
}

resource "aws_lb" "main" {
  name               = replace(local.name, "rtype", "alb")
  internal           = false   #external
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnets

  enable_deletion_protection = var.env == "prod" ? true : false # use Condition Expression: if true : false
  # true if only env is PROD, but the others should be false

  tags = merge(local.tags, { Name = replace(local.name, "rtype", "alb") }) # here we wil combine(marge) Naming and Standart Tags
}

resource "aws_security_group" "alb_sg" {
  name        = replace(local.name, "rtype", "alb-sg")
  description = "Allow inboud traffic"
  tags        = merge(local.tags, { Name = replace(local.name, "rtype", "alb-sg") })
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # We will replace it with Load Balancer SG ID
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_egress" {
  type              = "egress"
  from_port         = 0    #ALL PORTS
  to_port           = 0    #ALl PORTS
  protocol          = "-1" # -1 means TCP UDP ICMP 
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}