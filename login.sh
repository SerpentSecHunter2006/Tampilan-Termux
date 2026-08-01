#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m'

LOGIN_USER="SerpentSecHunter"

LOGIN_PASS="2007-07-19"

MAX_ATTEMPTS=3

LOCKOUT_DURATION=30

LOG_FILE="$HOME/.serpent_login.log"




log_failed_attempt() {
    local user="$1"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] Percobaan login gagal - Username: '$user'" >> "$LOG_FILE" 2>/dev/null
}

show_loading() {
    local msg="$1"
    local delay=0.08
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    local end=$((SECONDS + 2))
    while [ $SECONDS -lt $end ]; do
        local char="${spinstr:$i:1}"
        echo -ne "\r${CYAN}${char}${NC} ${msg}..."
        i=$(( (i+1) % ${#spinstr} ))
        sleep $delay
    done
    echo -ne "\r\033[K"
}

show_lockout_countdown() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        echo -ne "\r${RED}  ⏳ Tunggu ${BOLD}${seconds}${NC}${RED} detik...${NC}  "
        sleep 1
        ((seconds--))
    done
    echo -ne "\r\033[K"
}


show_banner() {
    echo -e "${GREEN}"
    cat << "EOF"
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                 ...                                
                                  ....:+##%%#*-...                           
                            ...:+##*-..... ...-*#%%%%%%%%%%*:..                          
                           ..=%%%%%%%%%+... ...-*%%%%%%%%%%%%%%%%%-..                         
                          ..=%%%%%%%%%%%%%+......-#%%%%%%%%%%%%%%%%%%%%%#:.                         
                          .:*%%%%%%%%%%%%%%%%%##%%%%%%%%%%%%%%%%%%%%%%%%%%-.                         
                          .-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#..                        
                          .+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@:                         
                         .:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*..                       
                        ..=%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%:.                       
                       ...%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%+.                       
                       ..-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@..                      
                      ...#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%=..                     
                      ..:@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#...                    
                       .*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-..                    
                      .:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*..                    
              ........:+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#-.......              
         .....:-=+#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#+==:......        
     ....:=*% ...      
     .:+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%+:..    
    ..*% ...    
    ..-#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-.     
     ...:+#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#+-..      
        ....:==*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#*==:....        
            .......:--==+*#%%@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@%%#*+==--:.......            
                   ..............::---========================---::...............                  
                                       ...................... ..                                
                         .......................................................                      
                    ....:+*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##*=....                   
                   ...+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#-...                 
                  ..-#%%%%%%%%#=-::::-=#%%%%%%%%%%%%%%%%%%%%%%*=-::::-+#%%%%%%%%+..                 
                  .:*%%%%%%+:..... .......-%%%%%%%%%%%%%%%@-.............:+%%%%%%=.                 
                 ..-%%%%%%... ...+%%%%%%%%%%%%+... ....#%%%%#.                 
                 ..=@%%%%=. ..-%%%%%%%%%%%@:. ...-%%%%%:                 
                 ..=%%%%%%:.. ..:*%%%%%##@%%%%#... ....%%%%%#.                 
                 ..-%%%%%%%#:.... .....*%%%%%-. ..+%%%%%*..... .. ....:#%%%%%%+.                 
                  ..+%%%%%%%%%%#+=--=+#%%%%%%%+.. ...-#%%%%%%%#+=--=*#%%%%%%%%%%-.                 
                  ...*%%%%%%%%%%%%%%%%%%%%%%*:... ...=%%%%%%%%%%%%%%%%%%%%%%%-..                 
                    ..-#%%%%%%%%%%%%%%%%%%*.... ....:#%%%%%%%%%%%%%%%%%%+...                  
                     ....:=*##%%%%%%%%%#+:.. . ..-*#%%%%%%%%###+-....                    
                       ................... .......... .. ..
EOF
    echo -e "${NC}"
}

show_header() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔══════════════════════════════════════════════════════════╗"
    echo "  ║           SERPENT SECURITY HUNTER  v2.0                 ║"
    echo "  ╠══════════════════════════════════════════════════════════╣"
    echo -e "  ║  ${YELLOW}COPYRIGHT  : SERPENT${CYAN}                                      ║"
    echo -e "  ║  ${YELLOW}GITHUB     : github.com/SerpentSecHunter2006${CYAN}               ║"
    echo -e "  ║  ${YELLOW}STATUS     : ${GREEN}● ONLINE${CYAN}                                      ║"
    echo "  ╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_welcome() {
    local username="$1"
    clear
    echo -e "${CYAN}${BOLD}"
    echo "  ╔══════════════════════════════════════════════════════════╗"
    echo "  ║                                                          ║"
    echo -e "  ║   ${GREEN}███████╗███████╗██████╗ ██████╗ ███████╗███╗   ██╗${CYAN}   ║"
    echo -e "  ║   ${GREEN}██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝████╗  ██║${CYAN}   ║"
    echo -e "  ║   ${GREEN}███████╗█████╗  ██████╔╝██████╔╝█████╗  ██╔██╗ ██║${CYAN}   ║"
    echo -e "  ║   ${GREEN}╚════██║██╔══╝  ██╔══██╗██╔═══╝ ██╔══╝  ██║╚██╗██║${CYAN}   ║"
    echo -e "  ║   ${GREEN}███████║███████╗██║  ██║██║     ███████╗██║ ╚████║${CYAN}   ║"
    echo -e "  ║   ${GREEN}╚══════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝${CYAN}   ║"
    echo "  ║                                                          ║"
    echo "  ╠══════════════════════════════════════════════════════════╣"
    echo -e "  ║  ${GREEN}✔  Login berhasil!${CYAN}                                       ║"
    echo -e "  ║  ${YELLOW}👤 Selamat datang, ${WHITE}${username}${CYAN}                            ║"
    echo -e "  ║  ${DIM}$(date '+%A, %d %B %Y  |  %H:%M:%S')${CYAN}                    ║"
    echo "  ╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}




trap '' SIGINT SIGQUIT SIGTSTP

attempts=0
locked=false

while true; do
    clear
    show_banner
    show_header

    echo -ne "  ${WHITE}${BOLD}👤 Username : ${NC}"
    read -r input_user

    echo -ne "  ${WHITE}${BOLD}🔑 Password : ${NC}"
    read -rs input_pass
    echo ""
    echo ""

    if [[ "$input_user" == "$LOGIN_USER" && "$input_pass" == "$LOGIN_PASS" ]]; then
        show_loading "Memverifikasi identitas"
        show_welcome "$input_user"
        sleep 2

        trap - SIGINT SIGQUIT SIGTSTP

        DASHBOARD="$(dirname "$(realpath "$0")")/dashboard.sh"
        if [[ -f "$DASHBOARD" ]]; then
            exec bash "$DASHBOARD"
        else
            echo -e "  ${RED}[ERROR] dashboard.sh tidak ditemukan: $DASHBOARD${NC}"
            exit 1
        fi

    else
        ((attempts++))
        log_failed_attempt "$input_user"

        echo -e "  ${RED}${BOLD}✘  Username atau password salah!${NC}"

        if [ $attempts -ge $MAX_ATTEMPTS ]; then
            echo ""
            echo -e "  ${RED}${BOLD}🔒 Akses dikunci! Terlalu banyak percobaan gagal (${MAX_ATTEMPTS}x).${NC}"
            echo ""
            show_lockout_countdown $LOCKOUT_DURATION
            attempts=0
            echo ""
        else
            remaining=$((MAX_ATTEMPTS - attempts))
            echo -e "  ${YELLOW}⚠  Sisa percobaan: ${BOLD}${remaining}${NC}${YELLOW} dari ${MAX_ATTEMPTS}${NC}"
            sleep 1.5
        fi
    fi
done
