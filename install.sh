#!/usr/bin/bash
clear

yellow_color="\e[0;33m"
blue_color="\e[0;34m"
pink_color="\e[0;35m"
green_color="\e[0;32m"
red_color="\e[0;31m"
white_color="\e[0m"
green_flag="\e[0m[\e[0;32m+\e[0m]"
red_flag="\e[0m[\e[0;31m-\e[0m]"
white_flag="[*]"

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"
curren_path=$(pwd) 

echo -e "$green_flag Iniciando instalação do neofetch do Brute!\n"
sleep 0.5

if [[ -d "$HOME/.config/neofetch" ]]
then
    if [[ -d "$HOME/.config/neofetch.bkp" ]]
    then
        echo -e "$green_flag Já existe um backup do neofetch.\n"
        sleep 0.5
    else
        mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp
        mkdir $HOME/.config/neofetch
        echo -e "$green_flag Backup da configuração atual do neofetch feito.\n"
        sleep 0.5
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
    read -p "[*] ${yesword}/${noword}: " yn
    if [[ "$yn" =~ $yesexpr ]]; then nf=true; break; fi
    if [[ "$yn" =~ $noexpr ]]; then nf=false; break; fi
    echo -e "Answer ${yesword}/${noword}."
done

sleep 0.5

if [[ $nf ]]
then
    if [[ $OSTYPE =~ 'linux' ]] 
    then 
        #install for linux with nerd fonts
        echo "install for linux with nerd fonts"
        sleep 0.5
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        #install for macos with nerd fonts
        sleep 0.5
        echo "install for macos with nerd fonts"
    fi
else
    #install without nerd fonts
    if [[ $OSTYPE =~ 'linux' ]] 
    then 
        #install for linux without nerd fonts
        echo "install for linux without nerd fonts"
        sleep 0.5
    elif [[ $OSTYPE =~ 'darwin' ]] 
    then
        #install for macos without nerd fonts
        echo "install for macos without nerd fonts"
        sleep 0.5
    fi
fi

#cp -rT /tmp/brute-neofetch/home/ $HOME/
#cd $path
#rm -rf /tmp/brute-neofetch
