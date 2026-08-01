#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

INSTALL_DIR="$HOME/.serpent"
BASHRC="$HOME/.bashrc"

echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║     SERPENT SECURITY HUNTER - INSTALLER     ║"
echo "  ╚══════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}[*] Memeriksa dependensi...${NC}"
if ! command -v tmux &>/dev/null; then
    echo -e "${YELLOW}[*] tmux tidak ditemukan. Menginstall...${NC}"
    pkg install tmux -y
    if ! command -v tmux &>/dev/null; then
        echo -e "${RED}[ERROR] Gagal menginstall tmux. Jalankan: pkg install tmux${NC}"
        exit 1
    fi
fi
echo -e "${GREEN}[✔] tmux OK${NC}"

echo -e "${YELLOW}[*] Membuat direktori instalasi: ${INSTALL_DIR}${NC}"
mkdir -p "$INSTALL_DIR"

echo -e "${YELLOW}[*] Menyalin file ke ${INSTALL_DIR}...${NC}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f "$SCRIPT_DIR/login.sh" || ! -f "$SCRIPT_DIR/dashboard.sh" ]]; then
    echo -e "${RED}[ERROR] File login.sh atau dashboard.sh tidak ditemukan di folder yang sama!${NC}"
    exit 1
fi

cp "$SCRIPT_DIR/login.sh"     "$INSTALL_DIR/login.sh"
cp "$SCRIPT_DIR/dashboard.sh" "$INSTALL_DIR/dashboard.sh"
chmod +x "$INSTALL_DIR/login.sh"
chmod +x "$INSTALL_DIR/dashboard.sh"
echo -e "${GREEN}[✔] File berhasil disalin${NC}"

echo -e "${YELLOW}[*] Mendaftarkan autostart ke ${BASHRC}...${NC}"

sed -i '/# >>> SERPENT AUTOSTART >>>/,/# <<< SERPENT AUTOSTART <<</d' "$BASHRC" 2>/dev/null

cat >> "$BASHRC" << 'SERPENT_EOF'
# >>> SERPENT AUTOSTART >>>
if [ -z "$TMUX" ] && [ -z "$SERPENT_BYPASS" ]; then
    SESSION="serpent_main"
    bash "$HOME/.serpent/login.sh"
    LOGIN_STATUS=$?
    if [ $LOGIN_STATUS -eq 0 ]; then
        if tmux has-session -t "$SESSION" 2>/dev/null; then
            tmux attach-session -t "$SESSION"
        else
            tmux new-session -s "$SESSION" "bash $HOME/.serpent/dashboard.sh"
        fi
    fi
    exit 0
fi
# <<< SERPENT AUTOSTART <<<
SERPENT_EOF

echo -e "${GREEN}[✔] Autostart berhasil didaftarkan${NC}"

echo ""
echo -e "${GREEN}${BOLD}"
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║           INSTALASI SELESAI! ✔              ║"
echo "  ╠══════════════════════════════════════════════╣"
echo -e "  ║  ${NC}${YELLOW}Tutup Termux sepenuhnya lalu buka lagi.${GREEN}${BOLD}        ║"
echo -e "  ║  ${NC}${YELLOW}Tampilan Login akan muncul otomatis.${GREEN}${BOLD}           ║"
echo "  ╚══════════════════════════════════════════════╝"
echo -e "${NC}"
