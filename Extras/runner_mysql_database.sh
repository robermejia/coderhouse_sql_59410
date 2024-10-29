#!/usr/bin/


echo "Iniciando la carga"
docker compose up -d --build


# Wait until MySQL is ready
until docker exec -it mysql mysql -u root -pcoderhouse -e "\q"
do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done

echo "Generamos arquitectura base"
## El archivo: Script_Entrega_Final_Roberto_Mejia_Collazos.sql es el archivo final ya para subir a Workbench o carga en Codespace.
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/Script_Entrega_Final_Roberto_Mejia_Collazos.sql"
echo "Carga completa"

## Ejecutando automatización
## 1. Estar ubicado en la carpeta Extras
## 2. Ejecutar sh runner_mysql_database.sh
## 3. En este caso me cargo en el puerto 8080