#!/bin/bash

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"

ok="[OK]"
ast="[*]"
error="[X]"

if [[ ! $(command -v neofetch) =~ 'neofetch' ]]
then
    echo -e "\n$error Neofetch não encontrado...\n"
    sleep 1
    exit
fi

echo -e "\n$ast Iniciando instalação do neofetch do Brute!\n"
sleep 1

if [[ -d "$HOME/.config/neofetch" ]]
then
    if [[ -d "$HOME/.config/neofetch.bkp" ]]
    then
        echo -e "$ast Já existe um backup do neofetch.\n"
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
echo -e "- Pinguim do Linux: "
echo -e "- Logo do Ubuntu: "
echo -e "- Logo do Fedora: "
echo -e "- Logo do Mac: "

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
        echo "$error Não consegui detectar seu sistema operacional :("
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
        echo "$error Não consegui detectar seu sistema operacional :("
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
fi


echo -e "\n$ok Pronto!\n"
sleep 1
