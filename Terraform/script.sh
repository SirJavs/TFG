#!/bin/bash

# Clonar el repositorio como el usuario 'ubuntu'
sudo -u ubuntu git clone https://github.com/SirJavs/T-Pot.git /home/ubuntu/tpotce

# Verificar si la clonación fue exitosa
if [ -d "/home/ubuntu/tpotce" ]; then
    echo "Repositorio clonado con éxito"
else
    echo "Error al clonar el repositorio"
    exit 1
fi

# Cambiar de directorio y ejecutar el script de instalación en una sola línea
sudo -u ubuntu bash -c "cd /home/ubuntu/tpotce && ./install.sh"

echo "Instalacion completada con exito, reinicio programado"

sudo reboot
