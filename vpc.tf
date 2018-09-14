variable "vpc_id" {
  default = "vpc-0874ae173f88dde03"
}

variable "internet_gateway_id" {
  default = "igw-018d83e4722c7f79b"
}

variable "routing_table_id" {
  default = "rtb-0cf28c880620f1f85"
}

# aws ec2 create-vpc --cidr-block 10.0.0.0/16 --amazon-provided-ipv6-cidr-block
# aws ec2 create-internet-gateway
# aws ec2 attach-internet-gateway --vpc-id vpc-0874ae173f88dde03 --internet-gateway-id igw-018d83e4722c7f79b
# aws ec2 create-route --route-table-id rtb-0cf28c880620f1f85 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-018d83e4722c7f79b
# aws ec2 create-route --route-table-id rtb-0cf28c880620f1f85 --destination-ipv6-cidr-block ::/0 --gateway-id igw-018d83e4722c7f79b
