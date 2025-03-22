#!/bin/bash
# Version 0.9 RC
# Verificar si dialog está instalado
if ! command -v dialog &> /dev/null; then
    echo "Error: 'dialog' no está instalado. Por favor instálalo primero."
    exit 1
fi

# Configurar teclado en español (UTF-8) si es necesario
export LANG=es_ES.UTF-8

# Función para mostrar información del sistema
mostrar_info() {
    local titulo="$1"
    local comando="$2"
    local tempfile=$(mktemp)
    
    eval "$comando" > "$tempfile" 2>&1
    dialog --title "$titulo" \
           --no-collapse \
           --textbox "$tempfile" \
           20 80
    rm -f "$tempfile"
}

# Bucle principal
while true; do
    # Mostrar menú con dialog
    eleccion=$(dialog --stdout \
        --backtitle "INFORMACIÓN DEL SISTEMA" \
        --title "Menú Principal" \
        --no-cancel \
        --menu "Seleccione una opción:" \
        15 50 8 \
        1 "Núcleo utilizado" \
        2 "Info completa del sistema" \
        3 "Info de la CPU" \
        4 "Nombre del equipo" \
        5 "Sistemas de ficheros montados" \
        6 "Salir")
    
    # Si el usuario cancela o sale
    if [ $? -ne 0 ]; then
        break
    fi

    # Manejar selección
    case "$eleccion" in
        1)
            mostrar_info "Núcleo utilizado" "uname"
            ;;
        2)
            mostrar_info "Información completa" "uname -a"
            ;;
        3)
            mostrar_info "Información de la CPU" "lscpu"
            ;;
        4)
            mostrar_info "Nombre del equipo" "hostname"
            ;;
        5)
            mostrar_info "Sistemas de ficheros" "df -Th"
            ;;
        6)
            clear
            exit 0
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
done

clear
