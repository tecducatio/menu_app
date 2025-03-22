#!/bin/bash
# Script de shell a  modo de ejemplo para comprobar el uso de git 
while true; so
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
1) uname ;;
2) uname -a ;;
3) lscpu ;;
4) hostname ;;
5) df -Th ;;
6|q|Q) exit 0;;
*)  echo " uso: [1][2][3][4][5][6]. La opción $valor no es válida" ;;
esac
done
