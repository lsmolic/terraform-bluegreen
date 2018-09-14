resource "aws_key_pair" "terraform-bluegreen-tut" {
  key_name   = "terraform-blue-green-v${var.infrastructure_version}"
  public_key = "${file("keypairs/keypair.pub")}"
}