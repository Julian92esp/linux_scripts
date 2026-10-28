#!/bin/bash

# Limpiar la pantalla al iniciar el script
clear

# Encabezado del script
echo "========================================="
echo "          Auditoría web con wget"
echo "========================================="
echo ""

# Mostrar menú de opciones
echo "Selecciona una opción:"
echo "1) Usar wget simple (sin opciones avanzadas)"
echo "2) Usar wget en modo auditoría avanzada (modo espejo)"
echo "3) Salir"
echo ""

# Leer la opción del usuario
read -p "Opción: " opcion

# Evaluar la opción seleccionada
case "$opcion" in

  1)
    # Descarga simple usando wget
    read -p "Introduce el dominio (ejemplo: https://example.com): " dominio
    echo "Iniciando descarga simple de: $dominio"

    # wget básico: descarga el contenido del dominio indicado
    wget "$dominio"

    echo "Proceso finalizado."
    ;;

  2)
    # Descarga avanzada en modo auditoría (modo espejo)
    read -p "Introduce el dominio (ejemplo: https://example.com): " dominio
    echo "Iniciando descarga web completa de: $dominio"

    # wget con múltiples opciones para auditoría web
    wget --mirror --convert-links --adjust-extension --page-requisites --wait=2 --limit-rate=200k --no-clobber --user-agent="Auditoria-Segura-Wget" "$dominio"

    echo "Proceso finalizado."

    # Descarga en modo espejo: descarga toda la web recursivamente
    # Convierte enlaces para navegación local
    # Ajusta extensiones según el tipo de archivo
    # Descarga todos los recursos necesarios (CSS, JS, imágenes)
    # Espera 2 segundos entre descargas
    # Limita velocidad a 200 KB/s
    # No sobrescribe archivos existentes
    # Cambia User-Agent para evitar bloqueos
    ;;

  3)
    # Salir del script
    echo "Saliendo..."
    exit 0
    ;;

  *)
    # Opción no válida
    echo "Opción no válida."
    ;;
esac
