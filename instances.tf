locals {
  subnets = ["${aws_subnet.terraform-bluegreen-tut.*.id}"]

  user_data = <<EOF
    #cloud-config
    runcmd:
    - docker run -d -p 80:80 nginx:latest
  EOF
}

resource "aws_instance" "terraform-bluegreen-tut" {
  count = 3
  ami = "ami-baa236c2"
  instance_type = "t2.micro"
  subnet_id = "${element(local.subnets, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.terraform-bluegreen-tut.id}"]
  key_name = "${aws_key_pair.terraform-bluegreen-tut.key_name}"

  user_data = "${local.user_data}"

  tags {
    Name = "Terraform Blue/Green ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = "${var.infrastructure_version}"
  }
}

output "instance_public_ips" {
  value = "${aws_instance.terraform-bluegreen-tut.*.public_ip}"
}