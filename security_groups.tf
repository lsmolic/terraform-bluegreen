resource "aws_security_group" "terraform-bluegreen-tut" {
  description = "Terraform Blue/Green"
  vpc_id = "${var.vpc_id}"
  name = "terraform-bluegreen-tut-v${var.infrastructure_version}" 

  tags {
    Name = "Terraform Blue/Green (v${var.infrastructure_version})"
  } 
}

resource "aws_security_group_rule" "terraform-bluegreen-tut-inbound" {
  type = "ingress"
  security_group_id = "${aws_security_group.terraform-bluegreen-tut.id}"
  from_port = -1
  to_port = 0
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "terraform-bluegreen-tut-outbound" {
  type = "egress"
  security_group_id = "${aws_security_group.terraform-bluegreen-tut.id}"
  from_port = -1
  to_port = 0
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}

# From/To Port: The port range the rule applies for. In this case, we target all possible port ranges
# Protocol: You can use either HTTP, TCP or “-1”, which applies for both TCP and HTTP
# CIDR Blocks: A list of CIDR blocks that are enabled by the rule. In our case, we enabled all ipv4 traffic.