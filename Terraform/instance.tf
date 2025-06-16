resource "aws_instance" "ubuntu_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.ubuntu_subnet.id
  vpc_security_group_ids      = [aws_security_group.ubuntu_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name # Asignar la clave SSH

  user_data = file("script.sh")

  root_block_device {
    volume_size = 128     # Tamaño del volumen raíz en GB 
    volume_type = "gp3" # Tipo de volumen: gp3, gp2, io1, etc.
  }

  tags = {
    Name = "T-Pot Ubuntu Server"
  }
}


