#!/bin/bash
echo "Iniciando el proceso de instalación"
echo "Levantando los servicios definidos en docker-compose.yml..."
docker-compose up -d

if [ $? -eq 0 ]; then
  echo "El entorno se ha configurado perfectamente. Accede a 
    mongo express en http://localhost:8081 
    hasura en http://localhost:8080"
else
  echo "Hubo un error al configurar el entorno. Revisa los logs para más detalles."
  exit 1
fi
