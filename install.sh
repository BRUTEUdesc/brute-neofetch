#!/bin/bash

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"

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

if [[ ! $(command -v neofetch) =~ 'neofetch' ]]
then
    echo -e "\n$error Neofetch não encontrado...\n"
    sleep 1
    exit
fi

if [[ ! $(command -v git) =~ 'git' ]]
then
    echo -e "\n$error Git não encontrado...\n"
    sleep 1
    exit
fi

echo -e "\n$ast Iniciando instalação do neofetch do Brute!\n"
sleep 1

if [[ -d "$HOME/.config/neofetch" ]]
then
    if [[ -d "$HOME/.config/neofetch.bkp" ]]
    then
        echo -e "$warn Já existe um backup do neofetch.\n"
        if [[ -f "$HOME/.config/neofetch/is_brute_config" ]]
        then
            rm $HOME/.config/neofetch/is_brute_config
        fi
        sleep 1
    else
        mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp
        echo -e "$ok Backup da configuração atual do neofetch feito.\n"
        sleep 1
    fi
else
    mkdir $HOME/.config/neofetch
fi

echo -e "$ast Você consegue ver esses símbolos?"
echo -e "- Pinguim do Linux:  "
echo -e "- Logo do Ubuntu: ${ORANGE}${NC} "
echo -e "- Logo do Fedora: ${BLUE}${NC} "
echo -e "- Logo do Mac: ${PINK}${NC} "

while true; do
    read -p "[*] (${yesword}/${noword})? " yn
    if [[ "$yn" =~ $yesexpr ]]; then nf=true; break; fi
    if [[ "$yn" =~ $noexpr ]]; then nf=false; break; fi
    echo "Answer ${yesword}/${noword}."
done

cd /tmp
if [[ -d "/tmp/brute-neofetch" ]]
then
    rm -rf brute-neofetch
fi
git clone https://github.com/BRUTEUdesc/brute-neofetch

if [[ $nf == true ]]
then
    if [[ $OSTYPE =~ 'linux' ]] 
    then
        # linux install with nerd fonts
        cp -rT brute-neofetch/homes/home_nerd_fonts $HOME
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        # macos install with nerd fonts
        cp -R brute-neofetch/homes/home_nerd_fonts_mac/ $HOME
    else
        echo "$error Não consegui identificar seu sistema operacional :("
        exit
    fi
else
    if [[ $OSTYPE =~ 'linux' ]] 
    then
        # linux install without nerd fonts
        cp -rT brute-neofetch/homes/home_no_nerd_fonts $HOME
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        # macos install without nerd fonts
        cp -R brute-neofetch/homes/home_no_nerd_fonts_mac/ $HOME
    else
        echo "$error Não consegui identificar seu sistema operacional :("
        exit
    fi
fi

clear

echo -e " Instalado!\n"
neofetch
sleep 1

echo -e "$ast Deseja iniciar o neofetch sempre que abrir seu shell (bash
ou zsh)? Isso será feito editando seus arquivos de login dos shells (.bashrc e .zshrc)"

while true; do
    read -p "[*] (${yesword}/${noword})? " yn
    if [[ "$yn" =~ $yesexpr ]]; then run=true; break; fi
    if [[ "$yn" =~ $noexpr ]]; then run=false; break; fi
    echo "Answer ${yesword}/${noword}."
done

if [[ $run == true ]]
then
    if [[ $OSTYPE =~ 'linux' ]] 
    then
        # linux run on init
        touch $HOME/.config/neofetch/is_brute_config
        if [[ -f $HOME/.bashrc ]]
        then
            cat brute-neofetch/files/run_neofetch_on_login.sh >> $HOME/.bashrc
        fi
        if [[ -f $HOME/.zshrc ]]
        then
            cat brute-neofetch/files/run_neofetch_on_login.sh >> $HOME/.zshrc
        fi
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        # macos run on init
        touch $HOME/.config/neofetch/is_brute_config
        if [[ -f $HOME/.bashrc ]]
        then
            cat brute-neofetch/files/run_neofetch_on_login.sh >> $HOME/.bashrc
        fi
        if [[ -f $HOME/.zshrc ]]
        then
            cat brute-neofetch/files/run_neofetch_on_login.sh >> $HOME/.zshrc
        fi
    fi
else
    echo -e "$ast Se desejar rodar o neofetch toda vez que abrir o shell, adicione o seguinte comando ao seu arquivo de login do shell: "
    # check if bat exists else uses cat
    if [[ $(command -v bat) =~ 'bat' ]]
    then
        bat -pp -n brute-neofetch/files/run_neofetch_on_login.sh
    else
        cat -n brute-neofetch/files/run_neofetch_on_login.sh
    fi
fi


echo -e "\n$ok Pronto!\n"
sleep 1
