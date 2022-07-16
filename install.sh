#!/bin/bash

yellow_color="\e[0;33m"
blue_color="\e[0;34m"
pink_color="\e[0;35m"
green_color="\e[0;32m"
red_color="\e[0;31m"
white_color="\e[0m"
green_flag="\e[0m[\e[0;32m+\e[0m]"
red_flag="\e[0m[\e[0;31m-\e[0m]"
white_flag="\e[0m[*]"

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"
curren_path=$(pwd) 

if [[ ! $(command -v neofetch) =~ 'neofetch' ]]
then
    echo -e "\n$red_flag Neofetch não encontrado...\n"
    sleep 1
    exit
fi

echo -e "\n$green_flag Iniciando instalação do neofetch do Brute!\n"
sleep 1

if [[ -d "$HOME/.config/neofetch" ]]
then
    if [[ -d "$HOME/.config/neofetch.bkp" ]]
    then
        echo -e "$white_flag Já existe um backup do neofetch.\n"
        sleep 1
    else
        mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp
        echo -e "$green_flag Backup da configuração atual do neofetch feito.\n"
        sleep 1
    fi
else
    mkdir $HOME/.config/neofetch
fi

echo -e "$white_flag Você consegue ver esses símbolos?"
echo -e "- Pinguim do Linux: $yellow_color$white_color"
echo -e "- Logo do Ubuntu: $red_color$white_color"
echo -e "- Logo do Fedora: $blue_color$white_color"
echo -e "- Logo do Mac: $pink_color$white_color"

while true; do
    read -p "[*] (${yesword}/${noword})? " yn
    if [[ "$yn" =~ $yesexpr ]]; then nf=true; break; fi
    if [[ "$yn" =~ $noexpr ]]; then nf=false; break; fi
    echo "Answer ${yesword}/${noword}."
done

if [[ $nf == true ]]
then
    if [[ $OSTYPE =~ 'linux' ]] 
    then
        echo "linux install with nerd fonts"
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        echo "macos install with nerd fonts"
    else
        echo "$green_flag Não consegui detectar seu sistema operacional :("
    fi
else
    if [[ $OSTYPE =~ 'linux' ]] 
    then
        echo "linux install without nerd fonts"
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        echo "macos install without nerd fonts"
    else
        echo "$green_flag Não consegui detectar seu sistema operacional :("
        exit
    fi
fi

clear

#instalar neofetch aqui
echo -e "$green_flag Instalado!\n"
neofetch
sleep 1

echo -e "$white_flag Deseja configurar para executar o neofetch sempre que abrir seu terminal?"
echo -e "Isso será feito editando seus arquivos de login dos shells (.bashrc e .zshrc)"

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
        echo -e "linux run on init\n"
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        echo -e "macos run on init\n"
    fi
fi


echo -e "$green_flag Pronto!"
sleep 1
