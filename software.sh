#!/bin/bash

# =====================================================
# Script de instalación de herramientas CLI
# Compatible con Debian / Ubuntu / Kali / Parrot / DietPi
# =====================================================

set -u

echo "[+] Actualizando repositorios..."
sudo apt update

# -----------------------------------------------------
# Paquetes principales
# -----------------------------------------------------

PACKAGES=(
    lynx
    fzf
    mariadb-server
    nmap
    speedtest-cli
    whois
    btop
    tree
    ufw
    ranger
    man-db
    openssh-server
    tcpdump
    ncdu
    micro
    tmux
    tldr
    cmatrix
    git
    python3
    wget
    curl
    ripgrep
    htop
    jq
    fail2ban
)

# -----------------------------------------------------
# Paquetes opcionales
# -----------------------------------------------------

OPTIONAL_PACKAGES=(
    fastfetch
    neofetch
    dust
    hollywood
    bat
    zoxide
    eza
)

echo "[+] Instalando paquetes principales..."

for pkg in "${PACKAGES[@]}"; do
    echo "    -> $pkg"

    if apt-cache show "$pkg" &>/dev/null; then
        sudo apt install -y "$pkg"
    else
        echo "    [!] Paquete no encontrado: $pkg"
    fi
done

echo "[+] Instalando paquetes opcionales..."

for pkg in "${OPTIONAL_PACKAGES[@]}"; do
    echo "    -> $pkg"

    if apt-cache show "$pkg" &>/dev/null; then
        sudo apt install -y "$pkg"
    else
        echo "    [!] No disponible en este sistema: $pkg"
    fi
done

# -----------------------------------------------------
# Alias útiles
# -----------------------------------------------------

echo "[+] Configurando aliases..."

# Alias para batcat -> bat
if command -v batcat &>/dev/null; then

    if ! grep -q "alias bat='batcat'" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# Alias bat" >> ~/.bashrc
        echo "alias bat='batcat'" >> ~/.bashrc

        echo "    [+] Alias bat añadido"
    fi
fi

# Alias para eza -> ls moderno
if command -v eza &>/dev/null; then

    if ! grep -q "alias ls='eza --icons'" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# Alias eza" >> ~/.bashrc
        echo "alias ls='eza --icons'" >> ~/.bashrc
        echo "alias ll='eza -lah --icons'" >> ~/.bashrc

        echo "    [+] Alias eza añadidos"
    fi
fi

# Activar zoxide automáticamente
if command -v zoxide &>/dev/null; then

    if ! grep -q "zoxide init bash" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# Zoxide" >> ~/.bashrc
        echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

        echo "    [+] Zoxide configurado"
    fi
fi

# -----------------------------------------------------
# Actualizar cache de tldr
# -----------------------------------------------------

if command -v tldr &>/dev/null; then
    echo "[+] Actualizando cache de tldr..."
    tldr --update || true
fi

# -----------------------------------------------------
# Información final
# -----------------------------------------------------

echo ""
echo "[+] Instalación completada correctamente."
echo "[+] Reinicia la terminal o ejecuta:"
echo ""
echo "    source ~/.bashrc"
echo ""