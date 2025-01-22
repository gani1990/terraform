resource "aws_vpc" "base" {
  # (resource arguments)
  cidr_block                           = var.cidr_block
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  tags = {
    "Name" = "myvpc-vpc"
  }
  ##vpc_id                                         = "vpc-0a54e8ad1be0c4f74"
}

resource "aws_subnet" "private1" {

  availability_zone = var.private_subnets_1.az
  cidr_block        = var.private_subnets_1.cidr_block
  tags = {
    "Name" = var.private_subnets_1.name
  }

  vpc_id = aws_vpc.base.id
}

resource "aws_subnet" "private2" {
  availability_zone = var.private_subnets_2.az
  cidr_block        = var.private_subnets_2.cidr_block
  tags = {
    "Name" = var.private_subnets_2.name
  }

  vpc_id = aws_vpc.base.id
}




resource "aws_subnet" "public1" {

  availability_zone = var.public_subnets_1.az
  cidr_block        = var.public_subnets_1.cidr_block
  tags = {
    "Name" = var.public_subnets_1.name
  }

  vpc_id = aws_vpc.base.id
}

resource "aws_subnet" "public2" {
  availability_zone = var.public_subnets_2.az
  cidr_block        = var.public_subnets_2.cidr_block
  tags = {
    "Name" = var.public_subnets_2.name
  }

  vpc_id = aws_vpc.base.id
}