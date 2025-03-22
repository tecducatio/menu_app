#!/bin/bash
# Script de shell a  modo de ejemplo para comprobar el uso de git 
delay(){ echo "Mostrando información"; sleep 3; }
while true; do
cat << EOF
************************

INFORMACIÓN DEL SISTEMA

***********************

Selección de sistemas:
1) Nuecleo utilizado
2) info completa del sistema
3) info de la cpu
4) Nombre del equipo
5) Sistemasde ficheros montados
6) salir (tb quit)
============================

Pulsa [1][2][3][4][5][6]

EOF
read valor
case $valor in
1) uname; delay ;;
2) uname -a ; delay ;;
3) lscpu ; delay;;
4) hostname ; delay ;;
5) df -Th  ; delay ;;
6|q|Q) exit 0;;
*)  echo " uso: [1][2][3][4][5][6]. La opción $valor no es válida" ;;
esac
done
