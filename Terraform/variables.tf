variable "aws_region" {
  description = "La región de AWS donde se desplegará la instancia de Ubuntu"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t2.xlarge"
}

variable "ami_id" {
  description = "ID de la AMI de Ubuntu Server 24.04"
  default     = "ami-0866a3c8686eaeeba"
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a la instancia"
  default     = "mykey" # Nombre de tu clave SSH en AWS
}
