resource "aws_instance" "web" {
  ami                         = data.aws_ami.webimage.id
  instance_type               = var.webserver_info.instance_type
  associate_public_ip_address = var.webserver_info.associate_public_ip_address
  key_name                    = aws_key_pair.base.key_name
  tags = {
    Name = var.webserver_info.name
  }

  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.base.id]

  depends_on = [aws_key_pair.base,
  aws_subnet.public, aws_security_group.base]

}
