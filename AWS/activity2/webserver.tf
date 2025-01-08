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
  // user_data              = file("./install.sh")

  root_block_device {
    encrypted   = true
    volume_size = 8
    volume_type = "gp3"
  }
  metadata_options {
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }

  depends_on = [aws_key_pair.base,
    aws_subnet.public,
    aws_security_group.base,
  data.aws_ami.webimage]

}



resource "null_resource" "web_trigger" {
  triggers = {
    buiild_id = var.buiild_id
  }

  connection {
    type        = "ssh"
    user        = var.webserver_info.username
    private_key = file(var.key_file_info.private_key_path)
    host        = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    script = "./install.sh"

  }
}

