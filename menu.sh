#!/bin/bash

# Función para mostrar el menú con dialog
mostrar_menu_dialog() {
  dialog --title "INFORMACIÓN DEL SISTEMA" \
         --menu "Seleccione una opción:" 10 60 5 \
         1 "Núcleo utilizado" "1" \
         2 "Info completa del sistema" "2" \
         3 "Info de la CPU" "3" \
         4 "Nombre del equipo" "4" \
         5 "Sistemas de ficheros montados" "5" \
         6 "Salir" "6" \
         --output-fd 1
}

# Función para mostrar el resultado del comando con dialog
mostrar_resultado_dialog() {
  titulo="$1"
  resultado="$2"
  dialog --title "$titulo" --textbox 15 60 "$resultado"
}

# Bucle principal
while true; do
  opcion=$(mostrar_menu_dialog)

  case "$opcion" in
    "1")
      resultado=$(uname)
      mostrar_resultado_dialog "Núcleo utilizado" "$resultado"
      ;;
    "2")
      resultado=$(uname -a)
      mostrar_resultado_dialog "Info completa del sistema" "$resultado"
      ;;
    "3")
      resultado=$(lscpu)
      mostrar_resultado_dialog "Info de la CPU" "$resultado"
      ;;
    "4")
      resultado=$(hostname)
      mostrar_resultado_dialog "Nombre del equipo" "$resultado"
      ;;
    "5")
      resultado=$(df -Th)
      mostrar_resultado_dialog "Sistemas de ficheros montados" "$resultado"
      ;;
    "6")
      dialog --title "Saliendo" --msgbox "Saliendo del programa." 5 30
      exit 0
      ;;
    "") # El usuario presionó Cancelar o Esc
      echo "Cancelado."
      exit 1
      ;;
    *)
      dialog --title "Error" --msgbox "Opción inválida." 5 30
      ;;
  esac
done
