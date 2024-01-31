resource "aws_lb" "LB1" {
  name               = "LB1"
  load_balancer_type = "application"
  internal           = "false"
  security_groups    = [aws_security_group.sg1.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]
  tags = {
    Name = "LB1"
  }
}
resource "aws_lb_target_group" "TG1" {
  name     = "TG1"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc1.id
  health_check {
    path = "/"
    port = "traffic-port"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.LB1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.TG1.arn
    type             = "forward"
  }
}
output "loadbalancerdns" {
  value = aws_lb.LB1.dns_name
}