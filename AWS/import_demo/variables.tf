variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets_1" {
  type = object({
    name       = string
    cidr_block = string
    az         = string
  })

  default = {
    az         = "ap-south-1a"
    cidr_block = "10.0.128.0/20"
    name       = "myvpc-subnet-private1-ap-south-1a"
  }




}

variable "private_subnets_2" {
  type = object({
    name       = string
    cidr_block = string
    az         = string
  })

  default = {
    az         = "ap-south-1b"
    cidr_block = "10.0.144.0/20"
    name       = "myvpc-subnet-private2-ap-south-1b"
  }

}


variable "public_subnets_1" {
  type = object({
    name       = string
    cidr_block = string
    az         = string
  })

  default = {
    az         = "ap-south-1a"
    cidr_block = "10.0.0.0/20"
    name       = "myvpc-subnet-public1-ap-south-1a"
  }

}


variable "public_subnets_2" {
  type = object({
    name       = string
    cidr_block = string
    az         = string
  })

  default = {
    az         = "ap-south-1b"
    cidr_block = "10.0.16.0/20"
    name       = "myvpc-subnet-public2-ap-south-1b"
  }

}
