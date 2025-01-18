# data "aws_vpc" "default" {
#   default = true
# }

data "aws_security_group" "db" {
  name = var.security_group_name
}