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
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/1_Estructura_project.sql"
echo "Generamos ingesta de datos"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/2_Population.sql"
echo "Generamos Vistas"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/4_a_Vistas.sql"
echo "Generamos Funciones"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/4_b_Funciones.sql"
echo "Generamos Stored procedures"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/4_c_Stored_procedures.sql"
echo "Generamos Triggers"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/4_d_Triggers.sql"
echo "Generamos Roles y usuarios"
docker exec -it mysql mysql -u root -pcoderhouse -e "source /sql_code/5_Roles_Usuarios.sql"

echo "Carga completa"