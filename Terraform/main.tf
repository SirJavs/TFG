# VPC
resource "aws_vpc" "ubuntu_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Subred pública
resource "aws_subnet" "ubuntu_subnet" {
  vpc_id                  = aws_vpc.ubuntu_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "ubuntu_igw" {
  vpc_id = aws_vpc.ubuntu_vpc.id
}

# Tabla de rutas
resource "aws_route_table" "ubuntu_route_table" {
  vpc_id = aws_vpc.ubuntu_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ubuntu_igw.id
  }
}

# Asociación de la tabla de rutas con la subred
resource "aws_route_table_association" "ubuntu_route_table_association" {
  subnet_id      = aws_subnet.ubuntu_subnet.id
  route_table_id = aws_route_table.ubuntu_route_table.id
}

# Grupo de Seguridad para la instancia
resource "aws_security_group" "ubuntu_sg" {
  vpc_id = aws_vpc.ubuntu_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir acceso SSH desde cualquier IP
  }

  ingress {
    from_port   = 64295
    to_port     = 64295
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir acceso SSH desde cualquier IP
  }

  ingress {
    from_port   = 64297
    to_port     = 64297
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir acceso Admin Web
  }

    ingress {
    from_port   = 0
    to_port     = 64000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir acceso puertos IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permitir todo el tráfico saliente
    cidr_blocks = ["0.0.0.0/0"]
  }
}
