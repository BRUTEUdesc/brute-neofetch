#!/bin/bash

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"
curren_path=$(pwd) 

WHITE='\033[0;37m'
GREEN='\033[0;32m'
LIGHT_GRAY='\033[0;37m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
ORANGE='\033[0;38;5;208m'
BLUE='\033[0;34m'
PINK='\033[0;95m'
NC='\033[0m'

ok="${WHITE}[${GREEN}OK${WHITE}]${NC}"
ast="${WHITE}[${LIGHT_GRAY}*${WHITE}]${NC}"
warn="${WHITE}[${YELLOW}*${WHITE}]${NC}"
error="${WHITE}[${RED}X${WHITE}]${NC}"

if [[ $(command -v neofetch) =~ 'neofetch' ]]
then
    neofetch
fi

echo -e "\n$ast Desculpa, eu fiz meu melhor :'(\n"
sleep 1

if [[ -d "$HOME/.config/neofetch" ]]
then
    rm -rf $HOME/.config/neofetch
fi

if [[ -d "$HOME/.config/neofetch.bkp" ]]
then
    mv $HOME/.config/neofetch.bkp $HOME/.config/neofetch
fi

if [[ $(command -v neofetch) =~ 'neofetch' ]]
then
    neofetch
fi
