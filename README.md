# Proyecto de sistema de gestión de biblioteca-digital
Aplicación que utiliza mongoDB como base de datos principal, que se
acompañada de mongo express para visualizar y gestionar dichas colecciones. 
Aparte, se incluye la integración con Hasura visualizando la estructura de las tablas.

# Requisitos previos
Hay que tener instalado estos programas previamente.
- Docker (https://docs.docker.com/get-docker/)
- Docker compose (https://docs.docker.com/compose/install/)

# Configuración del entorno
1. Clona o descarga este repositorio.


# Base de datos mongoDB

El archivo `init.js` contiene la configuración inicial de las colecciones y los datos que puse de ejemplo para la base de datos mongoDB.


# Instrucciones de ejecución

1. Levantar el proyecto con docker compose:
  - chmod +x install.sh (para darte permisos al instalar)
  - ./install.sh (comprobara si tienes lo necesario instalado para iniciar los servicios)
  - docker-compose up -d (en caso de que lo anterior no funcione)

  Este comando ultimo iniciará todos los servicios definidos en `docker-compose.yml`, incluidos:
   - MongoDB
   - Mongo Express
   - Hasura

2. Acceso a mongo express y hasura:

   Una vez que los contenedores estén en marcha, accede a mongo express o hasura:

   - [http://localhost:8081]
   - [http://localhost:8080]

   Podrás visualizar las colecciones creadas y gestionar la base de datos.

# Comandos de utilidad

- Para detener todos los servicios:

  docker-compose down

- Para verificar los contenedores activos:

  docker ps
  docker ps -a (se ven los inactivos tambien)

# Problemas y soluciones

Si encuentras algún problema durante la ejecución, verifica que los puertos definidos en `docker-compose.yml` no estén siendo utilizados por otros servicios.

sudo lsof -i :5432 (a modo de ejemplo)
sudo systemctl stop postgresql (a modo de ejemplo)
