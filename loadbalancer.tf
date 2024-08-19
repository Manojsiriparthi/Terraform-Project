resource "aws_lb" "mylb" {
name = "CloudComputing"
internal           = false
load_balancer_type = "application"
security_groups    = [aws_security_group.sg.id]
subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]
}

resource "aws_lb_target_group" "tg" {
name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vp.id
   health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }
}
resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.ic.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.ic1.id
  port             = 80
}
resource "aws_lb_listener" "ll" {
  load_balancer_arn = aws_lb.mylb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

output "load_balancer_dns_name" {
  value = aws_lb.mylb.dns_name
  description = "The DNS name of the load balancer"
}

