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

variable "key_file_info" {
  type = object({
    name             = string
    public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsa")
  })
}


variable "webserver_info" {

  type = object({
    name = string
    ami_filter = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
      owner = optional(string, "099720109477")
    })
    # ami                         = optional(string, "ami-053b12d3152c0cc71")
    instance_type               = optional(string, "t2.micro")
    associate_public_ip_address = optional(bool, true)
    username                    = optional(string, "ubuntu")

  })

}

variable "buiild_id" {

  type    = string
  default = "1"
}
