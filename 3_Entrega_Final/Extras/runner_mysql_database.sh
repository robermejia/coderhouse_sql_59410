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
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/Script_Entrega_Final_Roberto_Mejia_Collazos.sql"
echo "Carga completa"