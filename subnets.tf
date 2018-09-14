locals {
  subnet_count = 3
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

resource "aws_subnet" "terraform-bluegreen-tut" {
  count = "${local.subnet_count}"  
  vpc_id = "${var.vpc_id}"
  availability_zone = "${element(local.availability_zones, count.index)}"
  cidr_block = "10.0.${local.subnet_count * (var.infrastructure_version - 1) + count.index + 1}.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "${element(local.availability_zones, count.index)} (v${var.infrastructure_version})"
  }
}

# Count: The number of Subnets we want to create
# Availability zone: In this case we are using the element() function which function takes a list and an index and returns the element, even if the index is greater than the number of elements. This is useful to assign a different availability zone to each subnet.
# VPC ID
# CIDR Block: This is probably the most confusing part. We interpolated the previously defined infrastructure_version variable into the CIDR block. This will help in the future, when creating the second version. You may change the CIDR Block with the one you defined in the VPC.
# Assign a Public IP by default to any Network Interface assigned to this subnet
# Name: We’ve appended the Infrastructure version into it