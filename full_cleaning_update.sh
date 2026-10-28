#!/bin/bash

# ===================================================
# SCRIPT DE LIMPIEZA COMPLETA PARA RASPBERRY PI 5
# ===================================================
# Este script realiza las siguientes tareas:
# 1. Actualiza el sistema y elimina paquetes huérfanos
# 2. Limpia caché de APT
# 3. Limpia archivos temporales
# 4. Limpia logs antiguos
# 5. Libera memoria caché del sistema
# 6. Limpia snapshots antiguos de snap
# 7. Limpia la carpeta de descargas del usuario
# 8. Limpia caché de navegadores (Chromium y Firefox)
# 10. Elimina paquetes .deb descargados no instalados
# ===================================================

echo "=== INICIANDO LIMPIEZA TOTAL DEL SISTEMA ==="

# ---------------------------------------------------
# 1. Actualizar sistema y limpiar paquetes huérfanos
# ---------------------------------------------------
echo
echo "Actualizando sistema y eliminando paquetes huérfanos..."
sudo apt update && sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
echo "Sistema actualizado y paquetes huérfanos eliminados."

# ---------------------------------------------------
# 2️. Limpiar caché de APT
# ---------------------------------------------------
echo
echo "Limpiando caché de APT..."
sudo apt clean
sudo apt autoclean
echo "Caché de APT limpia."

# ---------------------------------------------------
# 3️. Limpiar archivos temporales
# ---------------------------------------------------
echo
echo "Limpiando carpeta /tmp..."
sudo rm -rf /tmp/*
echo "Carpeta /tmp limpia."

# ---------------------------------------------------
# 4️. Limpiar logs antiguos (mayores a 7 días)
# ---------------------------------------------------
echo
echo "Limpiando logs antiguos..."
sudo journalctl --vacuum-time=7d
echo "Logs antiguos eliminados."

# ---------------------------------------------------
# 5️. Liberar memoria caché del sistema
# ---------------------------------------------------
echo
echo "Liberando memoria caché..."
sync
echo 3 | sudo tee /proc/sys/vm/drop_caches
echo "Memoria caché liberada."

# ---------------------------------------------------
# 6️. Limpiar snapshots antiguos de snap
# ---------------------------------------------------
echo
echo "Limpiando snapshots antiguos de snap..."
# Lista snaps deshabilitados y los elimina
sudo snap list --all | awk '/disabled/{print $1, $2}' | while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
done
echo "Snapshots antiguos eliminados."

# ---------------------------------------------------
# 7️. Limpiar carpeta de descargas
# ---------------------------------------------------
echo
read "Limpiando carpeta de descargas..." 
rm -rf /home/julianpi/Downloads/

# ---------------------------------------------------
# 8️. Limpiar caché de navegadores
# ---------------------------------------------------
echo
echo "Limpiando caché de navegadores (Chromium y Firefox)..."
rm -rf ~/.cache/chromium/*
rm -rf ~/.cache/mozilla/*
echo "Caché de navegadores limpia."

# ---------------------------------------------------
# 10. Limpiar paquetes .deb descargados pero no instalados
# ---------------------------------------------------
echo
echo "Eliminando paquetes .deb temporales..."
sudo rm -rf /var/cache/apt/archives/*.deb
echo "Paquetes temporales eliminados."

echo "=== FINALIZADA LIMPIEZA TOTAL DEL SISTEMA ==="
