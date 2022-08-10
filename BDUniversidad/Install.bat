echo Instalador de la base de datos Universidad
echo Autor: Feren Yabar
echo Fecha: 8/8/2022
sqlcmd -Slocalhost\SQLEXPRESS -E -i BDUniversidad.sql
sqlcmd -Slocalhost\SQLEXPRESS -E -i BDUniversidadPA.sql
echo Se ejecuto correctamente la base de datos
pause