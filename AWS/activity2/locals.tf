locals {
  anywhere             = "0.0.0.0/0"
  private_subnet_count = length(var.private_subnets)
  public_subnet_count  = length(var.public_subnets)
  
}