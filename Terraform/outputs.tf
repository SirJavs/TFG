output "ubuntu_instance_public_ip" {
  description = "La dirección IP pública de la instancia de ubuntu"
  value       = aws_instance.ubuntu_instance.public_ip
}
