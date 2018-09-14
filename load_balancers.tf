resource "aws_elb" "terraform-bluegreen-tut" {
  name            = "terraform-bluegreen-tut-v${var.infrastructure_version}"
  subnets         = ["${aws_subnet.terraform-bluegreen-tut.*.id}"]
  security_groups = ["${aws_security_group.terraform-bluegreen-tut.id}"]

  instances = ["${aws_instance.terraform-bluegreen-tut.*.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags {
    Name = "terraform-bluegreen-tut-v${var.infrastructure_version}"
  }
}

output "load_balancer_dns" {
  value = "${aws_elb.terraform-bluegreen-tut.dns_name}"
}