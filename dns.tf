# data "aws_route53_zone" "terraform-bluegreen-tut" {
#   name = "yourdomain.com."
# }

# resource "aws_route53_record" "terraform-bluegreen-tut" {
#   zone_id = "${data.aws_route53_zone.terraform-blue-green.zone_id}"
#   name    = "v${var.infrastructure_version}.yourdomain.com"
#   type    = "A"

#   alias {
#     name                   = "dualstack.${aws_elb.terraform-bluegreen-tut.dns_name}"
#     zone_id                = "${aws_elb.terraform-bluegreen-tut.zone_id}"
#     evaluate_target_health = false
#   }
# }