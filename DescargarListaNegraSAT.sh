#!/bin/bash
# Articulo 69 http://www.sat.gob.mx/cifras_sat/Paginas/datos/vinculo.html?page=ListCompleta69.html
# Articulo 69B  http://www.sat.gob.mx/cifras_sat/Paginas/datos/vinculo.html?page=ListCompleta69B.html

ruta="/ruta/de/ListaNegraSat"

# Elimina archivos CSV anteriores
find $ruta/69/ -iname '*.csv' -exec rm -f {} \;
find $ruta/69B/ -iname '*.csv' -exec rm -f {} \;

# Descargar Lista Negra de Morosos
wget -c -t1 -T10 http://www.sat.gob.mx/cifras_sat/Documents/Listado_Completo_69.csv -P $ruta/69/

# Descargar Lista Negra de Apocrifos
wget -c -t1 -T10 http://www.sat.gob.mx/cifras_sat/Documents/Listado_Completo_69-B.csv -P $ruta/69B/

# Obtengo unicamente el RFC de los contribuyentes
cat $ruta/69/Listado_Completo_69.csv |cut -f2 -d"," > $ruta/ListaNegraMor.txt
# Elimino las 4 primeras lineas que son basura
sed -i "1,4d" $ruta/ListaNegraMor.txt

# Obtengo unicamente el RFC de los contribuyentes
cat $ruta/69B/Listado_Completo_69-B.csv |cut -f2 -d"," > $ruta/ListaNegraApo.txt
# Elimino las 4 primeras lineas que son basura
sed -i "1,3d" $ruta/ListaNegraApo.txt
exit 0
