#!/bin/bash

#biraz da eğlence,bunu kardeşlerinizle oynayın ki konsola bakış açıları değişsin :) 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'


clear_screen() {
    clear
}

# Kedi
draw_cat() {
    echo -e "${YELLOW}"
    echo "  /\\___/\\"
    echo " (  o o  )"
    echo " (  =^=  )"
    echo "  (____)"
    echo -e "${NC}"
}

# Ev
draw_house() {
    echo -e "${RED}"
    echo "    /\\"
    echo "   /  \\"
    echo "  /____\\"
    echo "  |    |"
    echo "  | [] |"
    echo "  |____|"
    echo -e "${NC}"
}

# Gemi
draw_ship() {
    echo -e "${BLUE}"
    echo "    |    |"
    echo "   )_)  )_)"
    echo "  )___))___)"
    echo " )____)____)"
    echo "_____|_____|"
    echo " \\  -------/"
    echo "~~~~~~~~~~~~~~~~~~~"
    echo -e "${NC}"
}

# Baykuş
draw_owl() {
    echo -e "${PURPLE}"
    echo "  ,___,"
    echo "  [O.O]"
    echo "  /)__)"
    echo "   \" \""
    echo -e "${NC}"
}

# Robot
draw_robot() {
    echo -e "${CYAN}"
    echo "  [====]"
    echo "   [..] "
    echo "  |----| "
    echo "  |    | "
    echo " ||    ||"
    echo -e "${NC}"
}

# Ağaç
draw_tree() {
    echo -e "${GREEN}"
    echo "    /\\"
    echo "   /  \\"
    echo "  /____\\"
    echo "    ||"
    echo "    ||"
    echo "   ----"
    echo -e "${NC}"
}

# Kalp
draw_heart() {
    echo -e "${RED}"
    echo " /\\  /\\"
    echo "( v  v )"
    echo " \\    /"
    echo "  \\  /"
    echo "   \\/"
    echo -e "${NC}"
}

# Balık
draw_fish() {
    echo -e "${BLUE}"
    echo "    ><((('>"
    echo "    ><((('>"
    echo "    ><((('>"
    echo -e "${NC}"
}


# Kelebek
draw_butterfly() {
    echo -e "${PURPLE}"
    echo "  .\"/.\"."
    echo " .\\ | /."
    echo " .\\|/."
    echo "  .|."
    echo -e "${NC}"
}

# Papağan
draw_parrot() {
    echo -e "${GREEN}"
    echo "   /"
    echo "  //"
    echo " |>"
    echo "  \\\\"
    echo "   \\\\"
    echo "    \\"
    echo -e "${NC}"
}

# Uzay Gemisi
draw_spaceship() {
    echo -e "${CYAN}"
    echo "    /"
    echo " __/_\\__"
    echo "/  \\_/  \\"
    echo "|_______|"
    echo -e "${NC}"
}

# Çiçek
draw_flower() {
    echo -e "${YELLOW}"
    echo "    _"
    echo "  _(_)_"
    echo " (_)@(_)"
    echo "   (_)"
    echo "    |"
    echo "    |"
    echo "   \\|/"
    echo -e "${NC}"
}

# Kale
draw_castle() {
    echo -e "${WHITE}"
    echo "   |>>>|"
    echo "   |===|"
    echo "   |   |"
    echo "   |   |"
    echo "   |   |"
    echo " __|___|__"
    echo -e "${NC}"
}

# Vampir ahsdkjahfaa vampire bak 
draw_vampire() {
    echo -e "${PURPLE}"
    echo "   ,,,,"
    echo "  (-..-)"
    echo "  /)  (\\"
    echo "  /\\__/\\"
    echo "   \\__/"
    echo -e "${NC}"
}

# Fare
draw_mouse() {
    echo -e "${WHITE}"
    echo "  (\\\\_/)"
    echo "  (o.o)"
    echo "   (_)"
    echo -e "${NC}"
}

# Dinozor
draw_dino() {
    echo -e "${GREEN}"
    echo "    ,____,"
    echo "    |o o |"
    echo "    |__T_|"
    echo "    |    |"
    echo "   // \\\\|"
    echo -e "${NC}"
}


drawings=(
    draw_cat
    draw_house
    draw_ship
    draw_owl
    draw_robot
    draw_tree
    draw_heart
    draw_fish
    draw_butterfly
    draw_parrot
    draw_spaceship
    draw_flower
    draw_castle
    draw_vampire
    draw_mouse
    draw_dino
)


while true; do
    clear_screen
    echo -e "${YELLOW}=== Rastgele RESİM  Gösterisi ===${NC}"
    echo -e "${CYAN}Çıkmak için 'q', devam etmek için herhangi bir tuşa bas ben anlarımö${NC}"
    
    
    random_index=$((RANDOM % ${#drawings[@]}))
    ${drawings[$random_index]}
    
    
    read -n 1 key
    if [[ $key == "q" || $key == "Q" ]]; then
        echo -e "\n${GREEN}sıkıldınmı!${NC}"
        exit 0
    fi
done
