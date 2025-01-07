data "aws_ami" "webimage" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.webserver_info.ami_filter.name]

  }


  owners = [var.webserver_info.ami_filter.owner] # Canonical
}