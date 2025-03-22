#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    cat << 'EOF'
************************
INFORMACIÓN DEL SISTEMA
************************

Selección de sistemas:
1) Núcleo utilizado
2) Info completa del sistema
3) Info de la CPU
4) Nombre del equipo
5) Sistemas de ficheros montados
6) Salir (Q/q)

============================
Seleccione una opción [1-6]:
EOF
}

# Función para mostrar mensaje y pausar
pausar() {
    echo -e "\nMostrando información..."
    sleep 3
    clear
}

# Función para ejecutar comandos y gestionar la pausa
ejecutar_comando() {
    clear
    "$@"
    pausar
}

# Bucle principal
while true; do
    mostrar_menu
    read -p "Opción: " opcion
    
    case $opcion in
        1) ejecutar_comando uname ;;
        2) ejecutar_comando uname -a ;;
        3) ejecutar_comando lscpu ;;
        4) ejecutar_comando hostname ;;
        5) ejecutar_comando df -Th ;;
        6|q|Q) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción inválida: $opcion" && sleep 1 ;;
    esac
done
