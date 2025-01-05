variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "varibles for region"
}
variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "network_name" {
  type        = string
  description = "network name"
  default     = "mynetwork"
}

variable "private_subnets" {
  type = list(object({
    name       = string
    cidr_block = string
    a_zone     = string
  }))

}
variable "public_subnets" {
  type = list(object({
    name       = string
    cidr_block = string
    a_zone     = string
  }))
}
variable "web_security_group" {
  type = object({
    name        = optional(string, "web-sg")
    description = optional(string, "This is security group for web server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
      }
    ))
  })
  description = "web security group"

}

variable "db_security_group" {
  type = object({
    name        = optional(string, "db-sg")
    description = optional(string, "This is security group for db server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
      }
    ))
  })
  description = "web security group"

}
